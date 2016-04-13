=begin 

create class DBC_superhero
	+ attribute readers
	+ attribute readers/writers
	
	+ initialze method with 3 parameters (special_power, HP, energy_level)
		+ attribute 1: assign special_power to a variable
		+ attribute 2: superhero HP (hit-points) set to 100 (default)
		+ attribute 3: superhero energy set to 50 (default)
		+ attribute 4: homework energy level
	+ END of method 

	+ special power method
		+ prints description of power
		+ calculate damage
		+ subtract damage from work hp
		+ prints how much damage was done to work hp
	+ END of method

	+ basic power 1 method 
		+ prints description of power
		+ subtract energy level 
		+ calculate damage using random number within a range
		+ subtract damage from hp
		+ prints how much damage was done to work hp
	+ END of method 

	+ basic power 2 method 
		+ prints description of power
		+ subtract energy level 
		+ calculate damage using random number within a range
		+ subtract damage from hp
		+ prints how much damage was done to work hp

		+ prints damage done to self
		+ calculate damage using random number within a range
		+ subtract damage from superhero hp
		+ prints how much damage was done to superhero hp

	+ work attack method
		+ list of work attacks
		+ randomly select from attacks
		+ calculate damage usign random number within a range
		+ subtract damage from superhero hp
		+ prints how much damage was done to superhero hp
	+ END of method 

	+ healing method that takes an argument of 2 different types of potions (heal HP or energy)
		+ IF user chooses HP
			+ add 20 points to HP
			+ prints how many points added and new HP 
			+ prints updated HP
		+ ELSIF user choose strength
			+ add 20 points to energy level
			+ prints how many points added and new energy level
			+ prints updated energy level
	+ END of method
END of class

UI 
+ prints a message welcoming user to "DBC Superhero Creator" 
+ asks user if they would like to create a superhero 

+ input is empty 
+ empty array to store input

+ prompt user for input UNTIL they enter "done"
	+ get input 
	+ IF input is 'yes'
		+ what they would like their superhero name to be
			+ store answer in variable
		+ what they would like their special power to be 
			+ store answer in variable
		+ what they would like their healthpoint level to be, within a certain range
			+ store answer in variable and change to integer
		+ what they would like their energy point level to be, within a certain range
			+ store answer in variable and change to integer
		+ store all input in array
		+ ask user if they would like to create another superhero or "done"
	+ ELSIF input is 'done'
		+ thank user for using program
		+ BREAK
	+ ELSE
		+ print error
		+ ask for user input
	+ END of conditional
+ END of loop 

+ LOOP through array
	+ print each attribute 
+ END of LOOP

=end

class DBC_Superhero
	attr_reader :hp, :energy_level, :work_hp
	attr_accessor :special_power, :name

	def initialize(name, special_power, hp=100, energy_level=50)
		@name = name
		@special_power = special_power
		@hp = hp
		@energy_level = energy_level
		@work_hp = 100
	end

	def special_attack
		puts "You used '#{@special_power}'"
		@energy_level -= 20
		work_damage = rand(40..45)
		@work_hp -= work_damage
		puts "#{work_damage} damage was done to your work!"
	end

	def ruby_smash
		puts "You just crushed through that Ruby Challenge!"
		@energy_level -= 10
		work_damage = rand(20..40)
		@work_hp -= work_damage
		puts "#{work_damage} damage was done to your work!"
	end

	def wakeup_slap
		puts "You just slapped yourself so you could stay awake all night to code!"
		@energy_level -= 5
		work_damage = rand(10..20)
		@work_hp -= work_damage
		puts "#{work_damage} damage was done to your work!"

		puts "However, you hurt yourself in the process!"
		self_damage = rand(1..10)
		@hp -= self_damage
		puts "#{self_damage} damage was done to your face and your self-esteem!"
	end

	def hw_attack
		attack = ["confuse", "frustrate", "mega drain", "panic"]
		puts "Your work used its '#{attack.sample}' attack on you!"
		hp_damage = rand(10..20)
		@hp -= hp_damage
		puts "#{hp_damage} damage was done to you!"
	end

	def heal(potion_type)
		if potion_type == "HP potion"
			@hp += 20
			puts "You healed 20 HP points."
			puts "You now have #{@hp} HP."
		elsif potion_type == "energy potion"
			@energy_level += 20
			puts "You healed 20 energy points."
			puts "You now have an energy level of #{@energy_level}."
		end
	end
end

# USER INTERFACE
puts "Welcome to the Dev Bootcamp Superhero Creator"
puts "Would you like to create a DBC Superhero? Enter 'yes' or 'done'"

input = ""
superhero_list = []

until input == "done"
	input = gets.chomp

	if input == "yes"
		puts "What is your superhero name?"
		name = gets.chomp
	
		puts "What would you like your special super power to be?"
		power = gets.chomp
	
		puts "How many health points would you like to have? (1-500)"
		health = gets.chomp.to_i
	
		puts "How many energy points would you like to have? (1-250)"
		energy = gets.chomp.to_i

		superhero_list << "Name: #{name}\nPower: #{power}\nHP: #{health}\nEnergy: #{energy}\n"
	
		puts "Would you like to create another superhero? Enter 'yes' or 'done'"
	elsif input == "done"
		puts "\nThank you for using the Dev Bootcamp Superhero Creator"
		break
	else
		puts "Error: request denied"
		puts "Would you like to create another superhero? Enter 'yes' or 'done'"
	end
end 

puts "\nThe following superheros were created:\n"
superhero_list.each do |attribute| 
	puts attribute 
	puts 
end

=begin 

TEST RELEASE 1
one = DBC_Superhero.new("Bob", "super speed code writing")
one.special_attack
p one.work_hp
one.hw_attack
p one.hp
p one.energy_level
one.heal("HP potion")
p one.hp

one = DBC_Superhero.new("super speed code writing")
one.hw_attack
p one.hp 
one.hw_attack
p one.hp 

one = DBC_Superhero.new("super speed code writing")
p one.hp
p one.energy_level
 
two = DBC_Superhero.new("super speed code writing", 1, 1)
p two.hp
p two.energy_level
two.heal(HP potion)

=end 
