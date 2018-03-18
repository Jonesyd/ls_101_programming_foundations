original_array = [
  {a: 1},
  {b: 2, c: 3},
  {d: 4, e: 5, f: 6}
]

new_array = original_array.map do |hash|
  hash.transform_values do |value|
    value + 1
  end
end

p original_array
p new_array
