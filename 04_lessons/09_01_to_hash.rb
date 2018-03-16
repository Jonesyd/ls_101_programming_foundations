flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

hash = flintstones.each_with_object({}) do |element, name|
  name[element] = flintstones.index(element)
end

p hash
