hsh = {
  first: ['the', 'quick'],
  second: ['brown', 'fox'],
  third: ['jumped'],
  fourth: ['over', 'the', 'lazy', 'dog']
}

vowels = %w(a e i o u)
hsh.each do | _, value |
  value.each do |string|
    string.chars.each do |letter|
      puts letter if vowels.include?(letter)
    end
  end
end
