p arr = [1, 2, 3, 4, 5]
p arr[0] += 1
p arr

arr.each_with_index {|element, index| arr[index] = element + 1 }
p arr
