# change PLAYER DEALER constants to variables.

require "pry"
require "pry-byebug"

LIMIT = 21
DEALER_STOP = 17
WIN_SCORE = 5

def clear_cards(hash)
  hash[:hand] = []
  hash[:total] = 0
end

def initialize_deck
  deck = []
  starter_array = %w[A K Q J 10 9 8 7 6 5 4 3 2]
  starter_array.each do |card|
    deck << ["H", card]
    deck << ["D", card]
    deck << ["C", card]
    deck << ["S", card]
  end
  deck.shuffle
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

def display_score(plyr, dlr)
  blank_line
  prompt "Player score: #{plyr[:score]} | " \
         "Dealer score: #{dlr[:score]}"
  prompt "First to #{WIN_SCORE} wins"
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
        count = value.select { |card| card[1] == "A" }.count
        total = ace_value(total, count)
      end
      hash[:total] = total
    end
  end
end

def ace_value(total, count)
  while count > 0
    break if total <= LIMIT
    total -= 10
    count -= 1
  end
  total
end

def card_value(card)
  if ["K", "Q", "J"].include?(card)
    10
  elsif card == "A"
    11
  else
    card.to_i
  end
end

def display_dealer(hash)
  first_card = long_word(hash[:hand][0][1])
  blank_line
  prompt "Dealer has: #{first_card} and unknown card"
end

def display_player(hash)
  word_array = []
  hash.each do |key, value|
    if key == :hand
      value.each { |card| word_array << long_word(card[1]) }
    end
  end
  hv = hash[:name] == "You" ? "have" : "has"
  prompt "#{hash[:name]} #{hv}:   #{joinor(word_array)}" \
  " ... ... #{hash[:total]} is the total"
end

def display_each_card(hash)
  card = long_word(hash[:hand].last[1])
  draw = hash[:name] == "You" ? "draw" : "draws"
  prompt "#{hash[:name]} #{draw}: #{card}"
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

def bust?(hash)
  hash[:total] > LIMIT
end

def winner(hash)
  return if hash.nil?
  hash[:score] += 1
end

def auto_stay?(hash)
  hash[:total] == LIMIT ? true : false
end

def display_auto_stay
  sleep(0.5)
  prompt "Stay!"
  sleep(0.5)
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

def display_second_card(hash)
  card = long_word(hash[:hand][1][1])
  prompt "Dealer's second card is a #{card}"
end

def find_winner(plyr, dlr)
  if plyr[:total] > dlr[:total]
    plyr
  elsif plyr[:total] < dlr[:total]
    dlr
  else
    nil
  end
end

def display_result(hash)
  sleep(0.5)
  blank_line
  prompt "Your total is #{PLAYER[:total]}"  #work needed here
  if hash == PLAYER
    prompt "You WIN! CONGRATULATIONS!"
  elsif hash == DEALER
    prompt "Dealer wins. Better luck next time."
  else
    prompt "Even scores ... ... no winner, no loser."
  end
end

def quit_match?
  answer = nil
  loop do # another game
    blank_line
    prompt "How about another match ('y' or 'n')"
    answer = gets.chomp.downcase
    break if ["y", "n"].include?(answer)
    prompt "Okay ... just type a 'y' or 'n'"
  end
  answer == "n" ? true : false
end

def ready?
  answer = nil
  loop do # another game
    blank_line
    prompt "'y'  to deal the cards or 'x' to exit"
    answer = gets.chomp.downcase
    break if ["x","y"].include?(answer)
    prompt "Okay, just type a 'y' when you want to be dealt " \
           "or 'x to exit'"
  end
  answer == "x" ? true : false
end

def match_winner(plyr, dlr)
  [plyr, dlr].select {|hash| hash[:score] >= WIN_SCORE }
end

def reset_score(plyr, dlr)
  [plyr, dlr].each { |hash| hash[:score] = 0 }
end

def display_goodbye
  blank_line
  prompt "Thanks for playing. You did good."
  blank_line
end

loop do # match loop
  PLAYER = { name: "You", hand: [], total: 0, score: 0 }
  DEALER = { name: "Dealer", hand: [], total: 0, score: 0 }
  loop do # game loop
    clear
    [PLAYER, DEALER].each { |plr| clear_cards(plr) }
    deck = initialize_deck
    display_score(PLAYER, DEALER)
    [PLAYER, DEALER].each { |plr| deal!(plr, deck, 2) }

    display_dealer(DEALER)
    display_player(PLAYER)

    loop do # Hit or stay
      if auto_stay?(PLAYER)
        display_auto_stay
        break
      end

      break unless hit?

      deal!(PLAYER, deck)
      display_each_card(PLAYER)
      display_player(PLAYER)

      if bust?(PLAYER)
        display_player_bust
        winner(DEALER)
        break
      end
    end

    if PLAYER[:total] <= LIMIT
      loop do # dealer
        break if DEALER[:total] >= DEALER_STOP
        deal!(DEALER, deck)
        display_each_card(DEALER)
      end
      if bust?(DEALER)
        winner(PLAYER)
        display_dealer_bust
      else prompt "Dealer stays"
      end
    end

    if !bust?(DEALER) && !bust?(PLAYER)
      display_second_card(DEALER)
      display_player(DEALER)
      victor = find_winner(PLAYER, DEALER)
      winner(victor)
      display_result(victor)
    end
    display_score(PLAYER, DEALER) # add parameters

    match_win = match_winner(PLAYER, DEALER)
    unless match_win.empty?
      blank_line
      prompt "MATCH WINNER IS #{match_win[0][:name].upcase}"
      break
    end

    break if ready?
  end
  break if quit_match?
  reset_score(PLAYER, DEALER)
end

display_goodbye
