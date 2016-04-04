class Santa
	def initialize(gender, ethnicity)
		p "Initializing Santa instance..."
		@gender = gender
		@ethnicity = ethnicity
		@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
		@age = 0
	end

	def celebrate_birthday
		@age += 1
	end

	def get_mad_at(reindeer_name)
		demoted_reindeer = @reindeer_ranking.delete(reindeer_name)
		@reindeer_ranking.push(demoted_reindeer)
	end

	def gender
		@gender 
	end

	def ethnicity
		@ethnicity
	end

	def speak
		p "Ho, ho, ho!  Haaaapy holidays!"
	end

	def eat_milk_and_cookies(cookie)
		p "That was a good #{cookie} cookie!"
	end
end


=begin
santa_1 = Santa.new("gender", "ethnicity")
santa_1.get_mad_at("Rudolph")


santa_1 = Santa.new("gende", "ethnicit")
santa_1.get_mad_at("Dasher")


santas = []
example_genders = ["cis", "gender questioning", "intersex"]
example_ethnicities = ["elf", "dwarf", "hobbit"]
example_genders.length.times do |i|
  santas << Santa.new(example_genders[i], example_ethnicities[i])
end

santa_1 = Santa.new
santa_1.speak
santa_1.eat_milk_and_cookies("sugar")
=end
