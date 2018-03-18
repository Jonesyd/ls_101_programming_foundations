arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
puts "arr1 equals #{arr1[2][1][3]}"

arr2 = [
  {first: ['a', 'b', 'c'], second: ['d', 'e', 'f']},
  {third: ['g', 'h', 'i']}
]
puts "arr2 equals #{arr2[1][:third][0]}"

arr3 = [
  ['abc'],
  ['def'],
  {third: ['ghi']}
]
puts "arr3 equals #{arr3[2][:third][0][0]}"

hsh1 = {
  'a' => ['d', 'e'],
  'b' => ['f', 'g'],
  'c' => ['h', 'i']
}
puts "hsh1 equals #{hsh1['b'][1]}"

hsh2 = {
  first: {'d' => 3},
  second: {'e' => 2, 'f' => 1},
  third: {'g' => 0}
}
puts "hsh1 equals #{hsh2[:third].key(0)}"

# Problem
#  reference the letter g for each of the above.
