pets = ['cat', 'parrot', 'dog', 'fish']

pe = pets.map do |pet|
  pet.size == 3
end

# cat dog
p pe
