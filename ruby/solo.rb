=begin 

create class DBC_superhero
	+ initialze method with 1 parameter (special_power, HP, energy_level)
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