loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer.downcase == "yes"
  puts "To exit, just type yes"
end
