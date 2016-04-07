=begin
module Shout
	def self.yell_angrily(words)
		words + "!!!" + " :("
	end

	def self.yell_happily(words)
		words + "!!!" + " :)"
	end
end

Shout.yell_angrily("AAAAAAAARG!")
Shout.yell_happily("YIPEEEEEEE!")
=end

module Shout
	def yell_angrily(words)
		words + "!!!" + " :("
	end

	def yell_happily(words)
		words + "!!!" + " :)"
	end
end

class Isley_Brothers
	include Shout
end

class Tom_Hanks
	include Shout
end

shouter_1 = Isley_Brothers.new
shouter_1.yell_happily("You know you make me wanna SHOUT")

shouter_2 = Tom_Hanks.new
shouter_2.yell_angrily("Willllllson")