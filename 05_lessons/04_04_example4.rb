my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end

p my_arr

# SAVOUR
# line | Action | Object  |  Side-Effects   |  Return Value | Used Return Value?
#  1    #each   \ outer_array \ no        \ original collection \ assigned to my_arr variable
#  1-7  block   \ sub-array \ no          \ sub-array           \ no.
#  2    #each   \ sub-array \ no          \ sub-array     \ *** yes, return value of outer block
#  2-6  block   \ element in sub-array \ no \ nil         \ nil (if blocks return nil)
#  4    #puts   \ element in sub-array \ output if > 5 \ nil \ by block in return value
#
# What will be teh output?
# 18
# 7
# 12
# What will be the value of my_arr?  The oringal collection
#   => [[18, 7], [3, 12]]


# Variable assignment is an action.
