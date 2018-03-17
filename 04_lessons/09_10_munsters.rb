munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def age_group(int)
  return "senior" if int.to_i >= 65
  return "adult"  if int.to_i >= 18
  return "kid"    if int.to_i >= 0
  return nil      if int.to_i < 0
end

munsters.each do |key, value|  # value is a hash
  age = munsters[key]["age"]
  group = age_group(age)
  munsters[key]["age_group"] = group
end

p munsters

solution_hash = { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

p munsters == solution_hash
