p str = "joe's favorite color is blue"
p str[0] = 'J'
p str

p str[6] = 'F'
p str

p index = str.index("c", 6)
p str[index] = "C"
p str
p index

p str[str.index("i",index)] = "I"
p str

p str[str.index("b", index)] = "B"
p str
