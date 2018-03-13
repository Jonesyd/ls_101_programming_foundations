hsh = {
  'fruit'     => 'apple',
  'vegetable' => 'carrot',
  'fruit'     => 'pear'
}
p hsh

hash = {
  'apple' => 'fruit',
  'carrot' => 'vegetable',
  'pear' => 'fruit'
}
p hash

p country_capitals = { uk: 'London', france: 'Paris', germany: 'Berlin' }
p country_capitals.keys      # => [:uk, :france, :germany]
p country_capitals.values    # => ["London", "Paris", "Berlin"]
p country_capitals.values[0] # => "London"
