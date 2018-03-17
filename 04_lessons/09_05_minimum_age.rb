flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

ind = flintstones.index { |name| name[0..1] == "Be" }

p ind
p flintstones[ind]
