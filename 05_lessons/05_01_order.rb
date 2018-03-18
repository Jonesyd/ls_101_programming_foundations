arr = ['10', '11', '9', '7', '8']

new_array = arr.sort_by { |str| str.to_i }

p arr
p new_array

# problem: order array of number strings:
#   by descending numeric value
# pass a block to the sort_by method
#   in block to_i

# *** descending ****

# solution

solution = arr.sort do |a,b|
  b.to_i <=> a.to_i
end

p solution
