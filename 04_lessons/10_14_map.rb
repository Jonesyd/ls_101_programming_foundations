m = ['green', 'blue', 'red'].map do |word|
  puts word
  word.upcase
end

p m
p m == ['GREEN', 'BLUE', 'RED']
