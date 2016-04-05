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
		+subtract damage
		+ prints how much damage was done (number of damage is set by random number within a range)
	+ END of method 

	+ special power method
		+ prints description of power
		+ subtract damage
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

	def initialize(special_power, hp=100, energy_level=50)
		@special_power = special_power
		@special_power_count = 3
		@hp = hp
		@energy_level = energy_level
		@work_hp = 100
	end

	def special_power
			puts "You used #{@special_power}"
			work_damage = rand(50..60)
			@work_hp -= work_damage
			puts "#{work_damage} damage was done to your work!"
			puts "You have #{@special_power_count -= 1} special power uses left."
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
		puts "#{self_damage} damage was done to your face!"
	end

	#Put these at the bottom, bc if they are at the top, the attributes won't update when methods are called
	attr_reader :hp, :energy_level, :work_hp
	attr_accessor :special_power
end

=begin 
TEST RELEASE 1

one = DBC_Superhero.new("super speed code writing")
one.wakeup_slap
one.work_hp
p one.hp

one = DBC_Superhero.new("super speed code writing")
p one.hp
p one.energy_level
 
two = DBC_Superhero.new("super speed code writing", 1, 1)
p two.hp
p two.energy_level

=end 

