=begin 

next letter method that takes a letter argument
	IF letter is 'z'
		RETURN 'a'
	ELSE
		call next method 
END of method

previous letter method that takes a letter argument
	alphabet string 
	IF letter is 'a'
		RETURN 'b'
	ELSE
		find index number of letter on alphabet string
		subtract that index number -1 
		RETURN letter 
	END of conditional
END of method


encrypt method that advances every letter of a string forward one letter
	counter to count number of times looped through each index number
	UNTIL counter is equal to password length
		IF letter is a space
			letter is equal to a space
		ELSIF letter is a capital letter
			downcase letter
			go to next letter 
			capitalize letter
		ELSE 
			go to next letter
		END of conditional
		add 1 to counter
END of method

decrypt method that takes ever letter of a string one letter backward
	counter to count number of times looped through each index number
	UNTIL counter is equal to password length
		IF letter is a space
			letter is equal to a space
		ELSIF letter is a capital letter
			downcase letter
			go to previous letter
			capitalize lettter
		ELSE
			go to previous letter
		END of conditional
		add 1 to counter
	END of loop
END of method

=end
