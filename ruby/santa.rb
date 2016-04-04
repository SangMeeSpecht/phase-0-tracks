class Santa
	def initialize(gender, ethnicity)
		p "Initializing Santa instance..."
		@gender = gender
		@ethnicity = ethnicity
		@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
		@age = 0
	end

	def speak
		p "Ho, ho, ho!  Haaaapy holidays!"
	end

	def eat_milk_and_cookies(cookie)
		p "That was a good #{cookie} cookie!"
	end
end

santas = []
example_genders = ["cis", "gender questioning", "intersex"]
example_ethnicities = ["elf", "dwarf", "hobbit"]
example_genders.length.times do |i|
  santas << Santa.new(example_genders[i], example_ethnicities[i])
end

#santa_1 = Santa.new
#santa_1.speak
#santa_1.eat_milk_and_cookies("sugar")
