# def color_valid(color)
#   ["blue", "green"].include?(color.downcase) ? true : false
# end

# solution

def color_valid(color)
  color == "blue" || color == "green"
end

p color_valid("blue")
p color_valid("green")
p color_valid("Blue")
p color_valid("Green")
p color_valid("red")
