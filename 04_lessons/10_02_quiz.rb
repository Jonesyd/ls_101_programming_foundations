# Given an array of strings representing integers,
# iterate through all of the items in the array.
# If the integer value of the string is odd add it to a new array of odd integer strings.
# Once iteration is complete the new array should contain all of the odd integer strings from the original array.

puts "example one"

numbers = ['2', '3', '5', '7', '8', '11', '13', '15', '18']
odd_numbers = []
number = 0

until number == numbers.size
  odd_numbers << numbers[number] if number.to_i.odd?

  number += 1
end

p odd_numbers

# does not work. if counter odd, not item.

puts "example two"

numbers = ['2', '3', '5', '7', '8', '11', '13', '15', '18']
odd_numbers2 = []

for number in numbers
  if number.to_i.odd?
    odd_numbers2.push(number)
  end
end

p odd_numbers2


puts "example three"

numbers = ['2', '3', '5', '7', '8', '11', '13', '15', '18']
odd_numbers3 = []
counter = 0

loop do
  number = numbers[counter].to_i

  odd_numbers3 << numbers[counter] unless number.even?

  counter += 1
  break if counter == numbers.size
end

p odd_numbers3
#yes

puts "example 4"

numbers = ['2', '3', '5', '7', '8', '11', '13', '15', '18']
odd_numbers4 = []

numbers.each do |number|
  odd_numbers4 << number if number.to_i.odd?
end

p odd_numbers4
# yes
