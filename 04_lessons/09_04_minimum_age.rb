ages = {
  "Herman" => 32,
  "Lily" => 30,
  "Grandpa" => 5843,
  "Eddie" => 10,
  "Marilyn" => 22,
  "Spot" => 237
}

min = ages.values.min
p min

minimum_age_people = {}
ages.each do | key, value|
  if value == min
    minimum_age_people[key] = value
  end
end

puts minimum_age_people.keys
