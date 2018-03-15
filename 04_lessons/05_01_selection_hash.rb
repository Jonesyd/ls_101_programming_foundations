produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(basket)
  keys_array = basket.keys
  fruit_hash = {}
  counter = 0

  while counter < keys_array.length

    current_key = keys_array[counter]
    current_value = basket[current_key]

    if basket[current_key].downcase == "fruit"
      fruit_hash[current_key] = current_value
    end

    counter += 1
  end

  fruit_hash
end

p select_fruit(produce)
