# Method to create a list 
# input: "milk eggs bread bananas"
# steps: 
  # break string into separate strings
  # create empty hash
  # add keys 
  # set default quantity (nil)
  # print the list to the console [can you use one of your other methods here?]
# output: hash

# Method to add an item to a list
# input: list;  1 cereal
# steps: 
  # add cereal to the hash with a value of 1
# output: hash with new values

# Method to remove an item from the list
# input: list; remove 1 bread 
# steps: 
  # delete key and value
# output: hash with updated key and value

# Method to update the quantity of an item
# input: list; 10 to 6 bananas
# steps: 
  #update value of bananas
# output: hash with updated value

# Method to print a list and make it look pretty
# input: list 
# steps: 
  #print sentence with hash info 
# output: list sentence

def original_list(string)
  item = string.split(" ")
  grocery_list = {}
  item.each { |item| grocery_list[item] = 1 }
  grocery_list
end

p original_list("lemonade tomatoes onions")
#p original_list("milk eggs bread bananas")

new_list = original_list("lemonade tomatoes onions")

def add_item(list, new_item, quantity)
  list[new_item] = quantity
  list
end

p add_item(new_list, "ice_cream", 1)
#p add_item(new_list, "cereal", 2)

def remove_item(list, item)
  list.delete(item)
  list
end

p remove_item(new_list, "lemonade")
#p remove_item(new_list, "bread")

def update_item(list, item, quantity)
  list[item] = quantity
  list
end

p update_item(new_list, "lemonade", 2)
p update_item(new_list, "tomatoes", 3)
p update_item(new_list, "ice_cream", 4)
#p update_item(new_list, "bananas", 2)

def print_list(list)
  puts "You need to buy:"
  list.each { |item, quantity| puts "#{item} #{quantity}" }
end

p print_list(new_list)

=begin 


=end