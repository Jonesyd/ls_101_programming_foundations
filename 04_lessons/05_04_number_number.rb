def multiply_numbers(numbers, integer)
  multi_numbers = []
  counter = 0

  loop do
    break if counter >= numbers.size

    multi_numbers << numbers[counter] * integer
    counter += 1
  end

  multi_numbers
end

p my_numbers = [1, 4, 3, 7, 2, 6]
p multiply_numbers(my_numbers, 10)
p my_numbers
