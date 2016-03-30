# Method to swap first and last name & switch letters in string
#   + Split single string into 2 strings and store in array (so you can iterate)
#   + Swap first and last name strings
#   + Iterate through each string
#     + Replace original characters with new characters
#     + Capitalize first character of each string
#   + Join strings in array into one string

def alias_manager(name)
  swap_name = name.split(" ")
  swap_name.insert(0, swap_name.delete_at(1))
  
  swap_name.map! { |string|
  string = string.tr("abcdefghijklmnopqrstuvwxyz ", "ecdfighjoklmnpuqrstvawxyzb ")
  string.capitalize!
  }

  swap_name.join(" ")
  
end

# Ask for user input and store answer in variable with lower case letters
# Call method
puts "Please enter your full name."
old_name = gets.chomp.downcase
alias_manager(old_name)