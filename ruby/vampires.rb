puts "How many employees will be processed?"
number_of_employees = gets.chomp.to_i

year = 2016
employee_count = 0

until employee_count >= number_of_employees
    employee_count += 1
	
	puts "What is your name?"
	name = gets.chomp

	puts "How old are you?"
	current_age = gets.chomp.to_i

	puts "What year were you born?"
	year_born = gets.chomp.to_i

	puts "Our company cafeteria serves garlic bread.  Should we order some for you? ('yes' or 'no')"
	garlic_bread = gets.chomp

	puts "Would you like to enroll in the company's health insurance? ('yes' or 'no')"
	insurance = gets.chomp

	finished_list = false

	while finished_list == false
  		puts "List any allergies, one at a time.  When completed, type 'done'."
  		allergies = gets.chomp

		if allergies == "sunshine"
			puts "Probably a vampire"
			finished_list = true
		elsif allergies == "done"
			finished_list = true
			if name == "Drake Cula" || name == "Tu Fang"
				puts "Definitely a vampire."
			elsif (current_age != year - year_born) && (garlic_bread == "no") && (insurance == "no")		
				puts "Almost certainly a vampire."
			elsif (current_age != year - year_born) && ((garlic_bread == "no") || (insurance == "no"))
				puts "Probably a vampire."
			elsif (current_age == year - year_born) && (garlic_bread == "yes")
				puts "Probably not a vampire."
			else 
				puts "Results inconclusive."
			end
		end
	end
end

puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."