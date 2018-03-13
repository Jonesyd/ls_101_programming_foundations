counter = 0

loop do
  puts 'Hello!'
  counter += 1
  break if counter == 5
end


counter = 0

loop do
  break if counter == 0
  puts 'Hello!'
  counter += 1
end
