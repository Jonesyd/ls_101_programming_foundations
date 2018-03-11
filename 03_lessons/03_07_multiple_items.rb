flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.push("Dino").push("Hoppy")
p flintstones

flintstones.pop
flintstones.pop
p flintstones

flintstones << "Dino" << "Hoppy"
p flintstones

flintstones.pop
flintstones.pop
p flintstones

flintstones.concat(["Dino"]).concat(["Hoppy"])
p flintstones

flintstones.pop
flintstones.pop
p flintstones

flintstones.concat(%w(Dino Hoppy))
p flintstones
