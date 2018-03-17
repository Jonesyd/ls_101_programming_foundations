numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# don't mutate the collection as iterating through it.
# Index changes


# part 2

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# 1 [delete 4]
# 2 [delete 3]
