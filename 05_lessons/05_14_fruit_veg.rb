hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

new_array = []

hsh.each_value do | details |
  if details[:type] == "fruit"
    colors = details[:colors]
    new_array << colors.map { |color| color.capitalize }
  elsif details[:type] == "vegetable"
    new_array << details[:size].upcase
  end
end

solution = [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]
p solution
p new_array

p solution == new_array
p hsh

# PEDAC
# Problem
#   return an array
#     with colors (capitalized) of the fruits, and
#     the sizes (uppercase) of the vegetables.
# Example
#   solution = [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]
# Data Structure
#   Input hash (wit nested hash) color values (array)
#   Output: new_array
# Algorith
#   new_array = []
#   hsh.each do |name, details|
#     if details[:type] == "fruit"
#       new_array << details[:colour].capitalize
#     if details[:type] == "vegetable"
#       new_array << details.[size].upcase
#   end
