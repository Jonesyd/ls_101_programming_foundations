# Given an array numbers which contains both:
# odd and even integers;
# create two new arrays,
# odd_numbers which contains the odd integers from the original array and
#  even_numbers which contains the even integers.

puts "example one..."

numbers = [1, 2, 4, 5, 7, 8, 10, 13, 14]

odd_numbers = numbers.select do |number|
                number.odd?
              end

even_numbers = numbers.select do |number|
                number.even?
              end

p odd_numbers
p even_numbers



puts "example two..."

numbers = [1, 2, 4, 5, 7, 8, 10, 13, 14]
odd_numbers2 = []
even_numbers2 = []

numbers.each do |number|
  if number.even?
    even_numbers2 << number
  elsif number.odd?
    odd_numbers2 << number
  end
end

p odd_numbers2
p even_numbers2



puts "example three ...."

numbers = [1, 2, 4, 5, 7, 8, 10, 13, 14]
odd_numbers3 = []
even_numbers3 = []

for number in numbers
  next if number.odd?
  even_numbers3 << number
end

for number in numbers
  next unless number.odd?
  odd_numbers3 << number
end

p odd_numbers3
p even_numbers3



puts "example 4"

numbers = [1, 2, 4, 5, 7, 8, 10, 13, 14]
odd_numbers4, even_numbers4 = numbers.partition do |number|
                              number.even?
                            end

p odd_numbers4
p even_numbers4
