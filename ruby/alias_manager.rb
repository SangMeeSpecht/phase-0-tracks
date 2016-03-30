#Ask for input
#Store input in variable

puts "Please enter your full name."
name = gets.chomp

# Method: 
#   +Split names into 2 elements and store in variable
#   +Swap first array element with second
#   +Change all letters to lowercase
#   +Split all string characters into individual strings
# Iteration:
#   +Iterate through array and swap all letters with secret letters
#   +Join strings back together 
#   +Capitalize first letter on each string

array = name.split(" ")

name.tr("abcdefghijklmnopqrstuvwxyz ", "ecdfighjoklmnpuqrstvawxyzb ")