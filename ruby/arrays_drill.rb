food = ["mango", "cheese", "pork belly", "ramen", "egg"]
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