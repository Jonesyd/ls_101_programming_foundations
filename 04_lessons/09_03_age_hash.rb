ages = {
  "Herman" => 32,
  "Lily" => 30,
  "Grandpa" => 402,
  "Eddie" => 10
}

ages.keep_if { |person, age| age < 100 }
p ages

# keep_if
# block < 100
