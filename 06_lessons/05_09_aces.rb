# method testing file

require "pry"
require "pry-byebug"

def sum(cards)
  card_values = []
  cards.each { |card| card_values << card_value(card[1]) }
  total = card_values.reduce(:+)
  if total > 21
    count = cards.select { |card| card[1] == "A" }.count
    total = ace_value(total, count)
  end
  total
end

def ace_value(total, count)
  while count > 0
    break if total <= 21
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


## Launchschool

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end


h1 = [['H', '3'], ['S', 'Q']]
h2 = [['H', 'A'], ['S', 'A']]
h3 = [['H', 'A'], ['S', 'A'], ['C', 'A']]
h4 = [['H', 'A'], ['S', 'A'], ['C', '2']]
h5 = [['H', 'A'], ['S', 'A'], ['C', '2'], ['S', '2']]
h6 = [['H', 'A'], ['S', 'A'], ['C', '4'], ['S', '5']]

array = [h1, h2, h3, h4, h5, h6]

array.each do |hand|
  puts "while loop ...... total is: #{sum(hand)}"
  puts "count.times ..... total is: #{total(hand)}"
  puts ""
end
