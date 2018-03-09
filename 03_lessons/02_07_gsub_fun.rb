def add_eigth(number)
  number + 8
end

number = 2
how_deep = "number"

5.times { how_deep.gsub!("number", "add_eigth(number)") }

p how_deep

puts eval how_deep
