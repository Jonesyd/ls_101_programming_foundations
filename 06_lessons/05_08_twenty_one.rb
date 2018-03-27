LIMIT = 21
PLAYER = { name: "You", hand: [], total: 0 }
DEALER = { name: "Dealer", hand: [], total: 0 }

def clear_cards(hash)
  hash[:hand] = []
  hash[:total] = 0
end

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

def deal!(hash, deck, crds=1)
  crds.times do
    card = deck.sample
    hash[:hand] << card
    deck.delete(card)
  end
  sum(hash)
  nil
end

def sum(hash)
  hash.each do |key, value|
    if key == :hand
      card_values = []
      value.each { |card| card_values << card_value(card[1]) }
      total = card_values.reduce(:+)
      if total > LIMIT
        count = value.select { |card| card[1]=="A" }.count
        total = ace_value(total, count)
      end
      hash[:total] = total
    end
  end
end

def ace_value(total, count)
  while count > 0
    break if total <= 21 #LIMIT
      total -= 10
      count -= 1
  end
  total
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
  prompt "#{name} #{have}:   #{joinor(word_array)}" \
  " ... ... #{total} is the total"
end

def display_each_card(hand, name)
  card = long_word(hand.last[1])
  name == "You" ? draw = "draw" : draw = "draws"
  prompt "#{name} #{draw} a #{card}"
  sleep(1)
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

def bust?(hash)
  hash[:total] > LIMIT
end

def auto_stay?(hand)
  hand == LIMIT ? true : false
end

def display_auto_stay
  sleep(1)
  prompt "Let's just assume you stay!"
  sleep(1)
  blank_line
end

def hit?
  decision = nil
  loop do # User Input
    prompt "Hit or stay? (type 'h' or 's')"
    decision = gets.chomp.downcase
    break if ["h", "s"].include?(decision)
    prompt "Okay ... just type a 'h' or 's'"
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
  sleep(1)
  blank_line
  prompt "Your total is #{player}"
  if dealer > player
    prompt "Dealer wins. Better luck next time."
  elsif player > dealer
    prompt "You WIN! CONGRATULATIONS!"
  else
    prompt "Even scores ... ... no winner, no loser."
  end
end

def quit_game?
  answer = nil
  loop do # another game
    blank_line
    prompt "Another game (just a simple 'y' or 'n')"
    answer = gets.chomp.downcase
    break if ["y", "n"].include?(answer)
    prompt "Okay ... just type a 'y' or 'n'"
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
  clear_cards(PLAYER)
  clear_cards(DEALER)
  deck = initialize_deck

  deal!(PLAYER, deck, 2)
  deal!(DEALER, deck, 2)

  display_dealer(DEALER[:hand])
  display_player(PLAYER[:hand], PLAYER[:total])

  loop do # Hit or stay
    break unless hit?

    deal!(PLAYER, deck)
    display_each_card(PLAYER[:hand], "You")
    display_player(PLAYER[:hand], PLAYER[:total])

    if bust?(PLAYER)
      display_player_bust
      break
    end

    if auto_stay?(PLAYER[:total])
      display_auto_stay
      break
    end
  end

  if PLAYER[:total] <= LIMIT
    loop do # dealer
      break if DEALER[:total] >= 17
      deal!(DEALER, deck)
      display_each_card(DEALER[:hand], "Dealer")
    end
    if bust?(DEALER)
      display_dealer_bust
    else prompt "Dealer stays"
    end
  end

  if !bust?(DEALER) && !bust?(PLAYER)
    display_second_card(DEALER[:hand])
    display_player(DEALER[:hand], DEALER[:total], "Dealer")
    display_result(PLAYER[:total], DEALER[:total])
  end

  break if quit_game?
end

display_goodbye
