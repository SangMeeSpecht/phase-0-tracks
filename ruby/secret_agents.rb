=begin 
REFACTORED SINCE TURNING IN ASSIGNMENT

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
	empty string to store changed letters
	UNTIL counter is equal to password length
		IF letter is a space
			letter is equal to a space
		ELSIF letter is a capital letter
			downcase letter
			go to next letter 
			capitalize letter
		ELSE 
			go to next letter
		add 1 to counter	
	END of conditional
	print encrypted message
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
	print decrypted message
END of method

UI
Ask user if they would like to decrypt or encrypt a password
	store answer in variable
	IF answer if encrypt
		print "Please enter the password you would like to encrypt."
		store answer in varible
	  	run encrypt method
	ELSIF answer is decrypt 
	  print "Please enter the password you would like to decrypt."
	  store answer in varible
	  run decrypt method
	ELSE 
	  print error message
	END of conditional
	print result to screen

=end

def next_letter(letter)
	if letter == "z"
		letter = "a"
	else
		letter.next
	end
end

def previous_letter(letter)
	alpha = "abcdefghijklmnopqrstuvwxyz"
	if letter == "a"
		letter = "z"
	else
		alpha_index = alpha.index(letter) 
		letter = alpha[alpha_index - 1]
	end
end

def encrypt(password)
	index = 0
	encrypted = ""
	until index == password.length
		letter = password[index]
		if letter == " "
			encrypted << " "
		elsif letter == letter.upcase
			encrypted << next_letter(letter.downcase).upcase
		else 
			encrypted << next_letter(letter)
		end
	index += 1
	end
	encrypted
end

def decrypt(password)
	index = 0
	decrypted = ""
	until index == password.length
		letter = password[index]
		if letter == " "
			decrypted << " "
		elsif letter == letter.upcase
			decrypted << previous_letter(letter.downcase).upcase
		else 
			decrypted << previous_letter(letter)
		end
	index += 1
	end
	decrypted
end

puts "Welcome secret agent.  Would you like to encrypt or decrypt a message?"
msg_type = gets.chomp

if msg_type == "encrypt"
	puts "Please enter the message you would like to encrypt."
	message = gets.chomp
	p encrypt(message)
elsif msg_type == "decrypt"
	puts "Please enter the message you would like to decrypt."
	message = gets.chomp
	p decrypt(message)
else
	puts "Are you a spy?!  Program will self destruct in..."
	puts "3..."
	puts "2..."
	puts "1..."
	puts "BOOM!"
end

=begin 

RELEASE 4
decrypt(encrypt("swordfish"))
decrypt(encrypt("The duck flies at midnight"))

RELEASE 3
encrypt("abc")
encrypt("zed")
decrypt("bcd")
decrypt("afe")

=end 

