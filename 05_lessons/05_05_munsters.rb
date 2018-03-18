munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}


ages = munsters.map do |key, value|
  if munsters[key]["gender"] == "male"
    munsters[key]["age"]
  else 0
  end
end

p ages.reduce(&:+)
