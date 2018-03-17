puts "example one..."

def star_method(stars)
  arr = []
  stars.each do |star|
    arr.push(star.upcase)
  end
  arr
end

p stars_1 = ['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']
p stars_2 = star_method(stars_1)


puts "example two..."

def star_method(stars)
  arr = []
  counter = 0

  until counter == stars.size
    star = stars[counter]
    arr << star if star.size > 4

    counter += 1
  end
  arr
end

p stars_1 = ['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']
p stars_2 = star_method(stars_1)


puts "example three..."

def star_method(stars)
  for star in stars
    star.downcase
  end
end

p stars_1 = ['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']
p stars_2 = star_method(stars_1)
# for returns the original collection


puts "example four..."

def star_method(stars)
  arr = []
  counter = 0

  until counter == stars.size do
    arr << stars[counter][0, 3]

    counter += 1
  end
  arr
end

p stars_1 = ['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']
p stars_2 = star_method(stars_1)
