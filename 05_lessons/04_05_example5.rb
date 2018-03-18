ex5 = [[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end

p ex5

# line \ Action \ Object \ Side-Effect \ Return Value \ Used Return Value
# 1    \ #map   \ outer_array \ no    \ new array     \ yes returned value of code
# 1-5  \ block  \ each sub_array  \ no     \ new_nested_array \ yes by map
# 2    \ #map (nested) \ each sub_array \ no \ new sub_array \ yes by outer block
# 2-3  \ block (nested) \ elements of sub_array \ elements * 2 \ yes by map
# 3    \ num    \ element of sub_array  \ no \ num x2  \ return value of block iteration

# What will the return value be in this example?
#   [[2, 4], [6, 8]]
