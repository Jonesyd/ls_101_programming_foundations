statement = "The Flintstones Rock"


chars_array = statement.split.join.chars.sort
count_hsh = {}

chars_array.each do |char|
  count_hsh[char] = chars_array.count(char)
end

p count_hsh
