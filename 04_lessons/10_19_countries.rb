#  Given the following hash which contains keys representing countries and values representing the capital cities of those countries,
# return a new hash containing only the key-value pairs where the country begins with the letter 'B'.


countries_and_capitals = {
  'France' => 'Paris',
  'Belgium' => 'Brussels',  #
  'Morocco' => 'Rabat',
  'Barbados' => 'Bridgetown', #
  'Peru' => 'Lima',
  'Bolivia' => 'La Paz',  #
  'Brazil' => 'Brasilia'  #
}


puts "example one..."

one = countries_and_capitals.select { |_, country| country[0] == 'B' }

# no. this one has cities begining with B
puts one


puts "example two..."

two = countries_and_capitals.each_with_object({}) do |(k, v), obj|
  obj[k] = v if k.chr == 'B'
end

# yes
puts two


puts "example three..."

def select_countries(hsh)
  sub_set = {}
  hsh.each_key do |country|
    if country[0] == 'B'
      sub_set[country] = hsh[country]
    end
  end
  sub_set
end

three = select_countries(countries_and_capitals)
p three

# yes - clever


puts "example four...."

def begins_with_b(string)
  string[0] == 'B'
end

four = countries_and_capitals.find_all do |country, capital|
  begins_with_b(country)
end

# no returns an array.

p four
