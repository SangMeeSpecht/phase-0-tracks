def return_array (param1, param2, param3)
  rtrn_array = [param1, param2, param3]
end


# This method will take in an array and an item to add into passed array
def add_item(array_param, new_item)
  array_param << new_item
end

food = []
food += ["mango", "cheese", "pork belly", "ramen", "egg"]
print food

food.delete_at(2)
print food

food.insert(2, "bacon")
print food

food.delete("mango")
print food

in_array = food.include?("ramen")
puts "Is \"ramen\" in the array? #{in_array}"

drinks = ["water", "beer", "wine"]
dinner = food + drinks
print dinner

p return_array(1, "hello", 4)
p add_item([1,2,3], "new item")