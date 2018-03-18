arr = [
  [2],
  [3, 5, 7],
  [9],
  [11, 13, 15]
]

# select

new_array = arr.map do |sub_array|
  sub_array.select do |int|
    int % 3 == 0
  end
end

p arr
p new_array

# reject

reject_array = arr.map do |sub_array|
  sub_array.reject do |int|
    int % 3 != 0
  end
end

p arr
p reject_array
