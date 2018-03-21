def joinor(array, separator=", ", conj="or" )
  return nil unless array.is_a?(Array)
  case array.size
  when 0 then ""
  when 1 then array[0].to_s
  when 2 then "#{array[0]} #{conj} #{array[1]}"
  else
    array[-1] = "#{conj} #{array[-1]}"
    array.join(separator)
  end
end


p joinor([1, 2])                   == "1 or 2"
p joinor([1])                      == "1"
p joinor([1, 2, 3])                == "1, 2, or 3"
p joinor([1, 2, 3], '; ')          == "1; 2; or 3"
p joinor([1, 2, 3], ', ', 'and')   == "1, 2, and 3"
p joinor("hello")                  == nil
