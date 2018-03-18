mixed_array = [[8, 13, 27], ['apple', 'banana', 'cantaloupe']]

new_array = mixed_array.map do |arr|
  arr.select do |item|
    if item.to_s.to_i == item    # if it's an integer
      item > 13
    else
      item.size < 6
    end
  end
end

# select returns [27, "apple"]
# map transforms [[27]["apple"]]
# the elements with the array are changed, but the mixed_array, still has two elements.

puts "The original array is #{mixed_array}"
puts "The new array is #{new_array}"
