p hash = {
  apple: 'Produce',
  carrot: 'Produce',
  pear: 'Produce',
  broccoli: 'Produce'
}

p hash[:apple] = 'Fruit'
p hash[:carrot] = 'Vegetable'
p hash[:pear] = 'Fruit'
p hash[:broccoli] = 'Vegetable'
p hash

# hash.each do |key, _ |
#   if hash[key] == hash[:apple] || hash[key] == hash[:pear]
#     hash[key] = "Fruit"
#   else
#     hash[key] = "Vegetable"
#   end
# end
#
# p hash
