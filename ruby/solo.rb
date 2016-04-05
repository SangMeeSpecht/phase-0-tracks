=begin 

create class DBC_superhero
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

    METHOD NOT INCLUDED IN THIS FILE; WILL USE ON FUTURE DRAFTS
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

	+ attribute readers
	+ attribute readers/writers
END of class

=end
class DBC_Superhero
	def initialize(special_power, hp=100, energy_level=50)
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

	#Put these at the bottom, bc if they are at the top, the attributes won't update when methods are called
	attr_reader :hp, :energy_level, :work_hp
	attr_accessor :special_power
end


=begin 
TEST RELEASE 1
one = DBC_Superhero.new("super speed code writing")
one.special_attack
one.work_hp

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

=end 

