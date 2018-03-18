example = [{ a: 'ant', b: 'elephant' }, { c: 'cat' }]
example2 = example.clone

result = example.select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end

p example
p result

result2 = example2.select do |hash|
  hash.any? do |key, value|
    value[0] == key.to_s
  end
end

p example2
p result2



# select uses return value of block (if true to create new array)
# all? returns true or false (used by select)
