require "pry"
require "pry-byebug"
=begin
1. Initialize deck
2. Deal cards to player and dealer
3. Player turn: hit or stay
  - repeat until bust or "stay"
4. If player bust, dealer wins.
5. Dealer turn: hit or stay
  - repeat until total >= 17
6. If dealer bust, player wins.
7. Compare cards and declare winner.
=end

def clear
  system("clear") || system("cls")
end

def prompt(msg)
  puts ">> #{msg}"
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

def deal!(hand, deck, crds=1)
  crds.times do
    card = deck.sample
    hand << card
    deck.delete(card)
  end
end

def display_dealer(hand)
  first_card = long_word(hand[0][1])
  "Dealer has: #{first_card} and unknown card"
end

def display_player(hand)
  word_array = ""
  hand.each do |card|
    word_array << long_word(card[1])
  end
  # Format "word_array" - re-create the joinor method
  "You have: #{word_array.inspect}"
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
  hand_values.reduce(:+)
end

clear
deck = initialize_deck
player_hand = []
dealer_hand = []

deal!(player_hand, deck, 2)
prompt "player hand is #{player_hand}"
p deck.count
deal!(dealer_hand, deck, 2)
prompt "dealer hand is #{dealer_hand}"
p deck.count

prompt display_dealer(dealer_hand)
prompt display_player(player_hand)

player_total = hand_sum(player_hand)
dealer_total = hand_sum(dealer_hand)

prompt "Player total is #{player_total}"
# prompt "Dealer total is #{dealer_total}"

loop do # Hit or Stay
  move = nil
  loop do # User Input
    prompt "Hit or Stay? (type 'h' or 's')"
    move = gets.chomp.downcase
    break if ["h", "s"].include?(move)
    prompt "just select 'h' or 's' thanks"
  end
  break if move == "s"
  deal!(player_hand, deck)
  prompt display_player(player_hand)
  player_total = hand_sum(player_hand)
  # expand out display for more cards so I can see them
  prompt "Player total is #{player_total}"
end


# need to handle ace total on bust -- separate method I think.
