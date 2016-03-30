#Ask for input and store in variable (make characters lowercase)
puts "Welcome to the TOP-SECRET Alias Management System"
puts "Please enter the full name you would like to change."
puts "Enter 'quit' when finished."
finished = false

until finished == true
  old_name = gets.chomp.downcase

  if old_name == "quit"
    puts "Thank you for using the Alias Management System.  Goodbye!"
    finished = true
  else 
    def alias_manager(name)      
# Split original string into two strings
      swap_name = name.split(" ")
# Swap the first string with the second
      swap_name.insert(0, swap_name.delete_at(1))

# Iterate through two strings and swap letters
# Capitalize first letter of each string
      swap_name.map! { |string|
      string = string.tr("abcdefghijklmnopqrstuvwxyz ", "ecdfighjoklmnpuqrstvawxyzb ")
      string.capitalize!
      }
# Join two strings into one and print
      puts swap_name.join(" ")
    end

    alias_manager(old_name)
    puts "Please enter another name to be changed.  Enter 'quit' if finished."
  end
end