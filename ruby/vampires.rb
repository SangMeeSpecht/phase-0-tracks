puts "How many employees will be processed?"
number_of_employees = gets.chomp.to_i

number_of_employees_count = 0

until number_of_employees_count == number_of_employees
	puts "What is your name?"
	name = gets.chomp

	puts "How old are you?"
	current_age = gets.chomp.to_i

	puts "What year were you born?"
	year_born = gets.chomp.to_i

	puts "Our company cafeteria serves garlic bread.  Should we order some for you?"
	garlic_bread = gets.chomp

	puts "Would you like to enroll in the company's health insurance?"
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
		end
	end

	if (current_age == 2016 - year_born) && (garlic_bread == "yes")
		puts "Probably not a vampire."
	elsif (current_age != 2016 - year_born) && ((garlic_bread == "no") || (insurance == "no"))
		puts "Probably a vampire."
	elsif (current_age != 2016 - year_born) && (garlic_bread == "no") && (insurance == "no")		
		puts "Almost certainly a vampire."
	elsif name == "Drake Cula" || name == "Tu Fang"
		puts "Definitely a vampire."
	else 
		puts "Results inconclusive."
	end

	number_of_employees_count += 1
end

puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."