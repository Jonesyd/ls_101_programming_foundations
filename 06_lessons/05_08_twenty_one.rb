LIMIT = 21

# Use constants
# Fix up the parameters so that they are less confusing
# Use a hash for player

require "pry"
require "pry-byebug"

def initialize_deck
  deck = []
  starter_array = %w(A K Q J 10 9 8 7 6 5 4 3 2)
  starter_array.each do |card|
    deck << ["H", card]
    deck << ["D", card]
    deck << ["C", card]
    deck << ["S", card]
  end
  deck
end

def clear
  system("clear") || system("cls")
end

def blank_line
  puts ""
end

def prompt(msg)
  puts ">>  #{msg}"
end

def deal!(hand, deck, crds=1)
  crds.times do
    card = deck.sample
    hand << card
    deck.delete(card)
  end
end

def display_dealer(hand)
  first_card = long_word(hand[0][1])
  blank_line
  prompt "Dealer has: #{first_card} and unknown card"
end

def display_player(hand, total, name="You")
  word_array = []
  hand.each do |card|
    word_array << long_word(card[1])
  end
  name == "You" ? have = "have" : have = "has"
  prompt "#{name} #{have}: #{joinor(word_array)}" \
  " ... ... #{total} is the total"
end

def display_each_card(hand, name)
  card = long_word(hand.last[1])
  name == "You" ? draw = "draw" : draw = "draws"
  prompt "#{name} #{draw} a #{card}"
  sleep(0.5)
end

def joinor(ary, sep=", ", conj="and")
  case ary.size
  when 0 then ""
  when 1 then ary[0].to_s
  when 2 then "#{ary[0]} #{conj} #{ary[1]}"
  else
    ary[-1] = "#{conj} #{ary[-1]}"
    ary.join(sep)
  end
end

def long_word(letter)
  case letter
  when "A" then "Ace"
  when "K" then "King"
  when "Q" then "Queen"
  when "J" then "Jack"
  else letter
  end
end

def card_value(card)
  value = nil
  if ["K", "Q", "J"].include?(card)
    value = 10
  elsif card == "A"
    value = 11
  else
    value = card.to_i
  end
  value
end

def sum(hand)
  hand_values = []
  hand.each do |card|
    hand_values << card_value(card[1])
  end
  total = hand_values.reduce(:+)
  if total > LIMIT
    hand.select { |card| card[1]=="A" }.count.times do
      total -= 10
    end
  end
  total
end

def bust?(hand)
  sum(hand) > LIMIT ? true : false
end

def auto_sit?(hand)
  hand == LIMIT ? true : false
end

def display_auto_sit
  sleep(0.5)
  prompt "Let's just assume you stay!"
  sleep(0.5)
  blank_line
end

def hit?
  decision = nil
  loop do # User Input
    prompt "Hit or Sit? (type 'h' or 's')"
    decision = gets.chomp.downcase
    break if ["h", "s"].include?(decision)
    prompt "Thanks, but just type a 'h' or 's'"
  end
  decision == "h" ? true : false
end

def display_player_bust
  prompt "Bust!"
  prompt "Dealer wins. Better luck next time."
end

def display_dealer_bust
  prompt "Dealer Bust!"
  blank_line
  prompt "You win!!! Congratulations!"
end

def display_second_card(dealer)
  card = long_word(dealer[1][1])
  prompt "Dealer's second card is a #{card}"
end

def display_result(player, dealer)
  sleep(0.5)
  blank_line
  prompt "Your total is #{player}"
  if dealer > player
    prompt "Dealer wins. Better luck next time."
  elsif player > dealer
    prompt "You WIN! CONGRATULATIONS!"
  else
    prompt "Even scores ... push ... no winner, no loser."
  end
end

def quit_game?
  answer = nil
  loop do # another game
    blank_line
    prompt "Another game (just a simple 'y' or 'n')"
    answer = gets.chomp.downcase
    break if ["y", "n"].include?(answer)
    prompt "Thanks, but just type a 'y' or 'n'"
  end
  answer == "n" ? true : false
end

def display_goodbye
  blank_line
  prompt "Thanks for playing. You did good."
  blank_line
end

loop do # game loop
  clear
  deck = initialize_deck
  player_hand = []
  dealer_hand = []

  deal!(player_hand, deck, 2)
  player_total = sum(player_hand)

  deal!(dealer_hand, deck, 2)
  dealer_total = sum(dealer_hand)

  display_dealer(dealer_hand)
  display_player(player_hand, player_total)

  loop do # Hit or Sit
    break unless hit?

    deal!(player_hand, deck)
    player_total = sum(player_hand)
    display_each_card(player_hand, "You")
    display_player(player_hand, player_total)

    if bust?(player_hand)
      display_player_bust
      break
    end

    if auto_sit?(player_total)
      display_auto_sit
      break
    end
  end

  if player_total <= LIMIT
    loop do # dealer
      break if dealer_total >= 17
      deal!(dealer_hand, deck)
      display_each_card(dealer_hand, "Dealer")
      dealer_total = sum(dealer_hand)
    end
    if bust?(dealer_hand)
      display_dealer_bust
    else prompt "Dealer sits"
    end
  end

  if !bust?(dealer_hand) && !bust?(player_hand)
    display_second_card(dealer_hand)
    display_player(dealer_hand, dealer_total, "Dealer")
    display_result(player_total, dealer_total)
  end

  break if quit_game?
end

display_goodbye
