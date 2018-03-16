c = ['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

p c

# Array#count accepts a block
# Counts where the block returns true
# should return 2

# count considers the truthiness of the block's return value
