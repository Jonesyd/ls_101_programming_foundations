r = { a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

puts "The return value is: #{r}"
