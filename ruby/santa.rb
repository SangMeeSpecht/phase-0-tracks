class Santa
	def initialize
		p "Initializing Santa instance..."
	end

	def speak
		p "Ho, ho, ho!  Haaaapy holidays!"
	end

	def eat_milk_and_cookies(cookie)
		p "That was a good #{cookie} cookie!"
	end
end

santa_1 = Santa.new
santa_1.speak
santa_1.eat_milk_and_cookies("sugar")