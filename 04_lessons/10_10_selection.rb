hsh = {a: 'apple', b: 'pear', c: 'orange', d: 'kiwi', e: 'banana'}
counter = 0

new_hsh = {}

for letter, fruit in hsh
  new_hsh[letter] = fruit if fruit.size > 4
end

p new_hsh


puts "second example"

def some_method(words)
  arr = []
  counter = 0

  loop do
    word = words[counter]
    arr << word if word.size < 4

    counter += 1
    break if counter == words.size
  end

  arr
end

poem = %w(April is the cruelest month)
p some_method(poem)


puts "third example"

num_arr = [2, 4, 7, 8, 11, 15]
counter = 0

until counter == num_arr.size
  puts num_arr[counter] + 1

  counter += 1
end
