def generate_UUID
  hex = ""
  (0..9).each {|n| hex << n.to_s }
  ("a".."f").each {|l| hex << l.to_s }

  uuid = ""
  32.times {|first| uuid << hex.chars.sample }

  indexes = [8, 12, 16, 20]
  indexes.each { |ind| uuid.insert(ind, "-") }
  uuid
end

p generate_UUID
