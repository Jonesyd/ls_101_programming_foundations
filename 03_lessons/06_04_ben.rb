# need false conition
# more fewer than 4 componets to ip address invalide, e.g.
#   4.5.5 or 1.2.3.4.5

def dot_separated_ip_address?(input_string)
  false unless input_string.is_a?(String)
  dot_separated_words = input_string.split(".")
  false unless dot_separated_words == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end

p dot_separated_ip_address?("4.5.5")
p dot_separated_ip_address?("1.2.3.4.5")
p dot_separated_ip_address?("10.4.5.11")

# solutions

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end

p dot_separated_ip_address?("4.5.5")
p dot_separated_ip_address?("1.2.3.4.5")
p dot_separated_ip_address?("10.4.5.11")
