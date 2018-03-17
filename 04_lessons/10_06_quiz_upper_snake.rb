def upper_snake(str)
  words = str.split
  current_word = 0

  loop do
    current_word += 1  # this line
    break if current_word == words.size

    words[current_word].upcase!
  end

  words.join('_')
end

p upper_snake("hello world")
p upper_snake("Hello World")
p upper_snake("HELLO WORLD")
