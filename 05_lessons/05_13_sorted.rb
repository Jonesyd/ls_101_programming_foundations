arr = [
  [1, 6, 7],
  [1, 4, 9],
  [1, 8, 3]
]

p arr

new_array = arr.sort_by do |sub_array|
  sub_array.select do |int|
    int % 2 != 0
  end
end


p new_array

solution = [[1, 8, 3], [1, 6, 7], [1, 4, 9]]
p solution
p new_array == solution
