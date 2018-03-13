str = 'abcde'
arr = ['a', 'b', 'c', 'd', 'e']

p str[2] # => "c"
p arr[2] # => "c"

p str[5] # => nil
p arr[5] # => nil

p arr = [3, 'd', nil]
p arr[2] # => nil
p arr[3] # => nil

p arr.fetch(2) # => nil
p arr.fetch(3)
