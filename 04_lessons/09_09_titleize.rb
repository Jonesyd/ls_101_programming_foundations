words = "the flintstones rock"

def titleize!(string)
  string.downcase.split.each do |word|
    string.gsub!(word, word.capitalize )
  end
end

# def titleize!(string)
#   array = string.downcase.split
#   array.each do |word|
#     string.gsub!(word, word.capitalize )
#   end
# end

titleize!(words)
p words
