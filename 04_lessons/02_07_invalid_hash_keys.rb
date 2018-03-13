p hsh = { :a => 1, 'b' => 'two', :c => nil }

p hsh['b']       # => "two"
p hsh[:c]        # => nil
p hsh['c']       # => nil
p hsh[:d]        # => nil

p hsh.fetch(:c)  # => nil
# p hsh.fetch('c')
p hsh.fetch(:d)
