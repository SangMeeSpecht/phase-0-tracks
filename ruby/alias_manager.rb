# Prompt user for input
puts "Welcome to the Alias Management System"
puts "Please enter the first and last name you would like to change."
puts "Enter 'quit' when finished."

# Create empty hash to store key(real name)-value(secret identity) pairs
id_list = {}

finished = false

# Loop to repeatedly prompt user for name change 
until finished == true
  old_name = gets.chomp
# Exit program if user is done
  if old_name == "quit"
    puts "Thank you for using the Alias Management System.  Goodbye!"
    finished = true
  else 
# Method to switch name position & swap letters
    def alias_manager(name)      
# Split original string into two strings
      down_name = name.downcase
      swap_name = down_name.split(" ")
# Insert a copy of the second string in index position 0, then delete original string in index position 1
      swap_name.insert(0, swap_name.delete_at(1))

# Iterate through two strings and swap letters in array permanently 
      swap_name.map! { |string|
      string = string.tr("abcdefghijklmnopqrstuvwxyz ", "ecdfighjoklmnpuqrstvawxyzb ")
# Permanently capitalize first letter of each string and store in array
      string.capitalize!
      }
# Join two strings into one and print
      new_name = swap_name.join(" ")
      p new_name
      new_name 
    end
# Assign method return value to new variable 
    new_name = alias_manager(old_name)
    
# Store names in empty hash
    id_list[old_name] = new_name

    puts "Please enter another name to be changed.  Enter 'quit' if finished."
  end
end

# Iterate through each key-value pair and print message to screen
id_list.each { |old_name, new_name| puts "The secret identity of '#{old_name}' is '#{new_name}'" }
