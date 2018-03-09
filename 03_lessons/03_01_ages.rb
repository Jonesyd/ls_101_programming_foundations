ages = {
  "Herman"  => 32,
  "Lily"    => 30,
  "Grandpa" => 402,
  "Eddie"   => 10
}

p ages.has_key?("Spot")
p ages.has_key?("Lily")

puts "second approach ..."
p ages.include?("Spot")
p ages.include?("Lily")

puts "third appraoch ..."
p ages.key?("Spot")
p ages.key?("Lily")

puts "Another one from the solution"
p ages.member?("Spot")
p ages.member?("Lily")
