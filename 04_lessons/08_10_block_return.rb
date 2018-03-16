m = [1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

p m

# return value, and why
# map returns arrays
# [1, nil, nil]
# because map returns an array of the return value of the block
# puts returns nil
