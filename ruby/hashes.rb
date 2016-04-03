=begin
Create empty hash to store key and value pairs

Ask for client name
Store answer in variable
Add variable as key and variable value as key value into hash

Ask for client age
Store answer in variable (change to integer)
Add variable as key and variable value as key value into hash

Ask for client children number
Store answer in variable (change to integer)
Add variable as key and variable value as key value into hash

Ask for client decor theme preference
Store answer in variable 
Add variable as key and variable value as key value into hash

Ask if client has pets
Store answer in variable 
Add variable as key and variable value as key value into hash

Print hash 

Ask designer if they would like to update a key 
Store answer in variable
If "yes", update value, if "no", then skip to next step, if other, then put "error" and loop to previous question

Print updated hash 
=end

client_data = {}

puts "Please enter your client's full name."
name = gets.chomp
client_data[:name] = name

puts "How old is your client?"
age = gets.chomp.to_i
client_data[:age] = age

puts "How many children does your client have?"
children = gets.chomp.to_i
client_data[:number_of_children] = children 

puts "What is your client's decor theme preference.  Please enter only one."
decor_theme = gets.chomp
client_data[:decor_theme] = decor_theme

puts "Does your client have any pets?  Enter 'true' or 'false'." 
pets = gets.chomp
client_data[:pets] = pets 

puts client_data

puts "Would you like to make any information updates? (Y/N)"
update = ""

until update == "Y" || update == "N"
	update = gets.chomp.upcase
	if update == "Y"
 		puts "Which item would you like to update?"
 		update_key = gets.chomp.to_sym
 		puts "What new information would you like to put for #{update_key}?"
 		update_value = gets.chomp
 		client_data[update_key] = update_value
 		break
  	elsif update == "N"
  		break
 	else
		puts "Error: request denied"
		puts "Would you like to make any information updates? (Y/N)"
	end
end

puts client_data