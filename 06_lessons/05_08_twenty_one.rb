# Announce the card (make it more fun)
# Show Dealers Cards (make it more fun)

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
  puts ">> #{msg}"
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

def display_player(hand, total)
  word_array = []
  hand.each do |card|
    word_array << long_word(card[1])
  end
  blank_line
  prompt "You have: #{joinor(word_array)}" \
  " ... ... #{total} is the total"
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

def hand_sum(hand)
  hand_values = []
  hand.each do |card|
    hand_values << card_value(card[1])
  end
  total = hand_values.reduce(:+)
  if total > 21
    hand.select { |card| card[1]=="A" }.count.times do
      total -= 10
    end
  end
  total
end

def bust?(hand)
  hand_sum(hand) > 21 ? true : false
end

def hit?
  decision = nil
  loop do # User Input
    prompt "Hit or Sit? (type 'h' or 's')"
    decision = gets.chomp.downcase
    break if ["h", "s"].include?(decision)
    prompt "Come on, you can do it, just type a 'h' or 's'"
  end
  decision == "h" ? true : false
end

def display_game_result(player, dealer)
  prompt "dealer total is #{dealer}" \
         " and your total is #{player}"
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
    prompt "Come on, you're better than this," \
           " just type 'y' or 'n' and that's it"
  end
  answer == "n" ? true : false
end

loop do # game loop
  clear
  deck = initialize_deck
  player_hand = []
  dealer_hand = []


  deal!(player_hand, deck, 2)
  player_total = hand_sum(player_hand)

  deal!(dealer_hand, deck, 2)
  dealer_total = hand_sum(dealer_hand)

  display_dealer(dealer_hand)
  display_player(player_hand, player_total)

  loop do # Hit or Sit
    break unless hit?

    deal!(player_hand, deck)
    player_total = hand_sum(player_hand)
    prompt display_player(player_hand, player_total)

    if bust?(player_hand)
      prompt "Bust!"
      prompt "Dealer wins. Better luck next time."
      break
    end
  end

  if player_total <= 21
    loop do # dealer
      break if dealer_total >= 17
      deal!(dealer_hand, deck)
      dealer_total = hand_sum(dealer_hand)
    end

    if bust?(dealer_hand)
      prompt "Dealer Bust!"
      prompt "You win!!! Congratulations!"
    end
  end

  if !bust?(dealer_hand) && !bust?(player_hand)
    display_game_result(player_total, dealer_total)
  end

  break if quit_game?
end

blank_line
prompt "Thanks for playing. You did good."
blank_line
