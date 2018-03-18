arr = [
  [[1], [2], [3], [4]],
  [['a'], ['b'], ['c']]
]

puts "arr before method #{arr}"

arr.map do |arr2|
  arr.pop
end

puts "arr after method #{arr}"

# what happens?
#   removes the second array
#   result: arr == [[1], [2], [3], [4]]
