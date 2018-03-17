def camel(str)
  words = str.split(' ')
  counter = 0

  while counter < words.size  # this line
    words[counter] = words[counter].capitalize

    counter = counter + 1
  end

  words.join
end

p camel("hello world")
p camel("Hello World")
p camel("HELLO WORLD")
