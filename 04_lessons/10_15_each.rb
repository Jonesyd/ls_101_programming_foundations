e = {a: 1, b: 2, c: 3, d: 4, e: 5}.each do |_, num|
  plus_one = num + 1
  puts "#{num} plus 1 is #{plus_one}"
end

p e
p e == {:a => 1, :b => 2, :c => 3, :d => 4, :e => 5}
