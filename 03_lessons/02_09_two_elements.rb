flintstones = {
  "Fred"    => 0,
  "Wilma"   => 1,
  "Barney"  => 2,
  "Betty"   => 3,
  "BamBam"  => 4,
  "Pebbles" => 5
 }

p flintstones

flintstones.keep_if { |k, v| k == "Barney" }
flintstones = flintstones.to_a.flatten!

p flintstones

# solution
puts "Actual solution..."

flintstones = {
  "Fred"    => 0,
  "Wilma"   => 1,
  "Barney"  => 2,
  "Betty"   => 3,
  "BamBam"  => 4,
  "Pebbles" => 5
 }

p flintstones.assoc("Barney")
