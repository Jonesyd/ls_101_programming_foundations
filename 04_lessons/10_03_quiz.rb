# Given an array of integers,
# for each integer output all integers from 1 to that integer;
# e.g. if the integer was 5, you would output 1, 2, 3, 4, 5.

puts "example one.... "

numbers = [7, 3, 5, 2, 1, 8, 4]
counter = numbers.size

loop do
  number = numbers[-counter]
  for num in 1..number
    puts num
  end

  break if counter == 1
  counter -=1
end


puts "example 2...."

numbers = [7, 3, 5, 2, 1, 8, 4]
counter = 0

loop do
  number = numbers[counter]
  counter = 0

  loop do
    counter += 1
    puts counter

    break if counter >= number
  end

  counter += 1
  break if counter >= numbers.size
end

# counters is overriding.

puts "example 3.... "

numbers3 = [7, 3, 5, 2, 1, 8, 4]

for number in numbers3
  counter = 0

  loop do
    counter += 1
    puts counter

    break if counter >= number
  end
end

# indirectly through counters

puts "example four ...."

numbers4 = [7, 3, 5, 2, 1, 8, 4]

numbers4.each do |number|
  counter = 0
  number.times do
    counter += 1
    puts counter
  end
end

# yes
