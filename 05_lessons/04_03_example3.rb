array = [[1, 2], [3, 4]]
b = array.map do |arr|
  puts arr.first
  arr.first
end

p b
p array


# line  Action |  Object  |  Side-Effect  |  Return Value  | Used Return Value?
# 1     #map   | Outer Array | No.        | new array      | no.
# 1-3   block | each sub array | No.     | index(0) of sub ary | in return array from #map
# 2     #first | each sub array | no.     | index(0) of sub ary | yes, by puts
# 2     #puts  | index(0) of sub array | outputs | nil         | no.
# 3     #first | each sub ary | no.       | index(0) of sub ary | yes returned by block, and mapped into new array.


# What is returned?
#   new array [1, 2]
# What are the side effects?
#   no side effects.
