advice = "Few things in life are as important as house training your pet dinosaur."

puts "include? method"
p advice.include?("Dino") == false
p advice.include?("Dino".downcase) == true
p advice.include?("dino") == true

puts "match? method"
p advice.match?("Dino")           == false
p advice.match?("Dino".downcase)  == true
p advice.match?("dino")           == true

puts "match method"
p advice.match("Dino")
p advice.match("Dino".downcase)
p advice.match("dino")            
