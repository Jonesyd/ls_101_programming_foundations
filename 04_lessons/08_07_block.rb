t = [1, 2, 3].any? do |num|
  puts num
  num.odd?
end

puts "The return value is: #{t}"

# Blocks return value?
#   true is returned (because there is at least one truthy return)
# in block, num.odd? returns true on 1 and 3
# Return value of #any? is true
# Output
# 1
# 2
# 3

# short circuit evaluation means that one the first iteration
# is excecuted. I.e. return gets a true on first iteration, and
# immediately returns.
