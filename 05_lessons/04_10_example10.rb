original_array = [
  [[1, 2], [3, 4]],
   [5, 6]
 ]

new_array = original_array.map do |arr|  # 2 arrays (one nested)
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer (not nested array)
      el + 1
    else                    # it's an array  (nested array)
      el.map do |n|
        n + 1
      end
    end
  end
end



p original_array
p new_array
p original_array == new_array
