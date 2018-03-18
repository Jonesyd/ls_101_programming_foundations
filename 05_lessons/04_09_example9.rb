original_array = [
  [[1], [2], [3], [4]],
  [['a'], ['b'], ['c']]
]

return_array = original_array.map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end


# what happens?
#   inner_most_block (level 3)
#     #partiion returns an array of true and false results.
#       all go in true [[#all in here],[]]
#         interger#size returns no of bytes
#   middle block returns the original collection (so partition return is ignored)
# nothing changes, map makes a copy of it self.

puts "original_array is: #{original_array}"
puts "return_array is: #{return_array}"
p original_array == return_array
