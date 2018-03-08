numbers = [1,2,3,4,5]
puts numbers.delete_at(1)  # returns 2
puts numbers == [1,3,4,5]

numbers = [1,2,3,4,5]
puts numbers.delete(1)     # returns 1
puts numbers == [2,3,4,5]
