famous_words = "seven years ago..."
prefix = "Four score and "

# first way
puts prefix + famous_words
puts famous_words

# second way
famous_words = "seven years ago..."
prefix = "Four score and "

puts prefix << famous_words  # mutating
puts prefix

# another solution
famous_words = "seven years ago..."
puts famous_words.prepend("Four score and ")
puts famous_words
