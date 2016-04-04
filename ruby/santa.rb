class Santa
	attr_accessor :gender, :ethnicity
	attr_reader :age, :reindeer_ranking

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

	#def gender
	#	@gender
	#end
	#
	#def ethnicity
	#	@ethnicity
	#end
	#
	#def gender =(new_gender)
	#	@gender = new_gender
	#end
	#
	#def ethnicity=(new_ethnicity)
	#	@ethnicity = new_ethnicity
	#end

	def speak
		p "Ho, ho, ho!  Haaaapy holidays!"
	end

	def eat_milk_and_cookies(cookie)
		p "That was a good #{cookie} cookie!"
	end
end

=begin

Release 2 & 3
santa_1 = Santa.new("female", "yeti")
p santa_1.ethnicity
p santa_1.ethnicity = "loch ness monster"

santa_2 = Santa.new("female", "yeti")
p santa_2.age

Release 1
santas = []
example_genders = ["cis", "gender questioning", "intersex"]
example_ethnicities = ["elf", "dwarf", "hobbit"]
example_genders.length.times do |i|
  santas << Santa.new(example_genders[i], example_ethnicities[i])
end

Release 0
santa_1 = Santa.new
santa_1.speak
santa_1.eat_milk_and_cookies("sugar")
=end
