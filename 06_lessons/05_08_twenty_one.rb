LIMIT = 21
DEALER_STOP = 17
WIN_SCORE = 5

def clear_cards!(user)
  user[:hand] = []
  user[:total] = 0
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

def deal!(user, deck, crds=1)
  crds.times do
    card = deck.sample
    user[:hand] << card
    deck.delete(card)
  end
  sum!(user)
  nil
end

def sum!(user)
  user.each do |key, value|
    if key == :hand
      card_values = []
      value.each { |card| card_values << card_value(card[1]) }
      total = card_values.reduce(:+)
      if total > LIMIT
        count = value.select { |card| card[1] == "A" }.count
        total = ace_value(total, count)
      end
      user[:total] = total
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

def display_dealer(user)
  first_card = long_word(user[:hand][0][1])
  blank_line
  prompt "Dealer has: #{first_card} and unknown card"
end

def display_hand(user)
  word_array = []
  user.each do |key, value|
    if key == :hand
      value.each { |card| word_array << long_word(card[1]) }
    end
  end
  blank_line
  hv = user[:name] == "You" ? "have" : "has"
  prompt "#{user[:name]} #{hv}:   #{joinor(word_array)}" \
  " ... ... #{user[:total]} is the total"
end

def display_each_card(user)
  card = long_word(user[:hand].last[1])
  draw = user[:name] == "You" ? "draw" : "draws"
  prompt "#{user[:name]} #{draw}: #{card}"
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

def bust?(user)
  user[:total] > LIMIT
end

def winner(user)
  return if user.nil?
  user[:score] += 1
end

def auto_stay?(user)
  user[:total] == LIMIT
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
  decision == "h"
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

def display_second_card(user)
  card = long_word(user[:hand][1][1])
  prompt "Dealer's second card is a #{card}"
end

def find_winner(plyr, dlr)
  if plyr[:total] > dlr[:total]
    plyr
  elsif plyr[:total] < dlr[:total]
    dlr
  end
end

def display_result(user)
  sleep(0.5)
  blank_line
  if user.nil?
    prompt "Even scores ... ... no winner, no loser."
  elsif user[:name] == "You"
    prompt "You WIN! CONGRATULATIONS!"
  elsif user[:name] == "Dealer"
    prompt "Dealer wins. Better luck next time."
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
  answer == "n"
end

def ready?
  answer = nil
  loop do # another game
    blank_line
    prompt "'h'  to deal the cards or 'x' to exit"
    answer = gets.chomp.downcase
    break if ["h", "x"].include?(answer)
    prompt "Okay, just type a 'h' when you want to be dealt " \
           "or 'x to exit'"
  end
  answer == "x"
end

def match_winner(plyr, dlr)
  [plyr, dlr].select { |user| user[:score] >= WIN_SCORE }
end

def reset_score!(plyr, dlr)
  [plyr, dlr].each { |user| user[:score] = 0 }
end

def display_goodbye
  blank_line
  prompt "Thanks for playing. You did good."
  blank_line
end

loop do # match loop
  player = { name: "You", hand: [], total: 0, score: 0 }
  dealer = { name: "Dealer", hand: [], total: 0, score: 0 }

  loop do # game loop
    clear
    [player, dealer].each { |plr| clear_cards!(plr) }
    deck = initialize_deck
    display_score(player, dealer)
    [player, dealer].each { |plr| deal!(plr, deck, 2) }

    display_dealer(dealer)
    display_hand(player)

    loop do # Hit or stay
      if auto_stay?(player)
        display_auto_stay
        break
      end

      break unless hit?

      deal!(player, deck)
      display_each_card(player)
      display_hand(player)

      if bust?(player)
        display_player_bust
        winner(dealer)
        break
      end
    end

    if player[:total] <= LIMIT

      loop do # dealer
        break if dealer[:total] >= DEALER_STOP
        deal!(dealer, deck)
        display_each_card(dealer)
      end

      if bust?(dealer)
        winner(player)
        display_dealer_bust
      else prompt "Dealer stays"
      end
    end

    if !bust?(dealer) && !bust?(player)
      display_second_card(dealer)
      display_hand(dealer)
      victor = find_winner(player, dealer)
      winner(victor)
      display_result(victor)
    end

    display_score(player, dealer)

    match_win = match_winner(player, dealer)
    unless match_win.empty?
      blank_line
      prompt "MATCH WINNER IS #{match_win[0][:name].upcase}"
      break
    end

    break if ready?
  end

  break if quit_match?
  reset_score!(player, dealer)
end

display_goodbye
