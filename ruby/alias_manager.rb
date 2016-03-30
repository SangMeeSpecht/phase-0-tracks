#Ask for input and store in variable (make characters lowercase)
puts "Welcome to the TOP-SECRET Alias Management System"
puts "Please enter the full name you would like to change."
puts "Enter 'quit' when finished."

# Create empty hash to store key (real name) value (secret identity) pairs
id_list = {}

finished = false

until finished == true
  old_name = gets.chomp

  if old_name == "quit"
    puts "Thank you for using the Alias Management System.  Goodbye!"
    finished = true
  else 
    def alias_manager(name)      
# Split original string into two strings
      down_name = name.downcase
      swap_name = down_name.split(" ")
# Swap the first string with the second
      swap_name.insert(0, swap_name.delete_at(1))

# Iterate through two strings and swap letters
# Capitalize first letter of each string
      swap_name.map! { |string|
      string = string.tr("abcdefghijklmnopqrstuvwxyz ", "ecdfighjoklmnpuqrstvawxyzb ")
      string.capitalize!
      }
# Join two strings into one and print
      new_name = swap_name.join(" ")
      p new_name
      new_name 
    end

    new_name = alias_manager(old_name)
    
# Store names in empty hash
    id_list[old_name] = new_name

    puts "Please enter another name to be changed.  Enter 'quit' if finished."
  end
end

id_list.each { |old_name, new_name| puts "The secret identity of '#{old_name}' is '#{new_name}'" }