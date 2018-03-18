arr = [
  ['1', '8', '11'],
  ['2', '6', '13'],
  ['2', '12', '15'],
  ['1', '8', '9']
]

sorted_array = arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end

p sorted_array
p arr

# inner block returns a int on each iteration
# map maps that to a new array, and returns it to the outer block
# An unorder sub_array of integers (but they are already ordered from lowest to highest).
# sort_by uses the return value of the block, which is the numeric sub_arr (even though it hasn't been ordered, it is in order)
# sort_by returns an ordered array (in string format)
