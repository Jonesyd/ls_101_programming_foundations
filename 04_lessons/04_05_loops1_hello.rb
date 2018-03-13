say_hello = 1

while say_hello <= 5
  puts 'Hello!'
  say_hello += 1
end

# solutions

say_hello = true
count = 0

while say_hello
  puts 'Hello!'
  count += 1
  say_hello = false if count == 5
end
