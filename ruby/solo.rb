=begin 

create class DBC_superhero
	+ initialze method with 3 parameters (special_power, HP, energy_level)
		+ attribute 1: assign special_power to a variable
		+ attribute 2: superhero HP (hit-points) set to 100 (default)
		+ attribute 3: superhero energy set to 50 (default)

	+ END of method 

	+ basic power 1 method 
		+ prints description of power
		+ prints how much damage was done (number of damage is set by random number within a range)
	+ END of method 

	+ basic power 2 method 
		+ prints description of power
		+ prints how much damage was done (number of damage is set by random number within a range)
	+ END of method 

	+ special power method
		+ prints description of power
		+ prints how much damage was done (number of damage is set by random number within a range)
	+ END of method

	+ healing method that takes an argument of 2 different types of potions (heal HP or energy)
		+ UNTIL user inputs correct arguments
			+ get user input 
			+ IF user chooses HP
				+ add 20 points to HP
				+ prints how many points added and new HP 
			+ ELSIF user choose strength
				+ add 20 points to energy level
				+ prints how many points added and new energy level
			+ ELSE
				+ print error
				+ ask user again what they would like to choose 
		+ END of loop
	+ END of method

END of class

=end
class DBC_Superhero
	attr_reader :hp, :energy_level

	def initialize(special_power, hp=100, energy_level=50)
		@special_power = special_power
		@hp = hp
		@energy_level = energy_level
	end
end

#TEST
one = DBC_Superhero.new("super speed code writing")
p one.hp
p one.energy_level
 
two = DBC_Superhero.new("super speed code writing", 1, 1)
p two.hp
p two.energy_level