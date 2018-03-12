require "pry"

greetings = { a: 'hi' }
puts greetings.object_id.inspect
puts greetings[:a].object_id.inspect

informal_greeting = greetings[:a].clone
puts informal_greeting.object_id.inspect

informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings
