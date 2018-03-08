range_array = Array(10..100)
puts range_array.include?(42)

# refactored
puts (10..100).include?(42)

# solution
puts (10..100).cover?(42)
