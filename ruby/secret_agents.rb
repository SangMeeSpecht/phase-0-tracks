=begin
An encrypt method that advances every letter of a string one letter forward.
-define method with parameter, which will contain the password encrypted
  -create counter that will keep track of how many times the string has gone through the loop
  -create a loop that will loop through each letter of the string argument
  -start with string character with smallest index number 
  -change letter to one letter forward
  -store letter in a varible
  -increase loop counter by one
  -keep looping until all the characters have been assigned a new letter
  -print encrypted password
  -if string contains "ab", substitute with "a" and return string, else return string


A decrypt method that reverses the process above. 
  -create counter that will keep track of how many times the string has gone through the loop
  -create a loop that will loop through each letter of the string argument
  -if string contains "!", substitute with " " and return string, else return string 
  -start with string character with smallest index number 
  -change letter to one letter backward, using the alphabet in a variable 
  -store letter in a varible
  -increase loop counter by one
  -keep looping until all the characters have been assigned a new letter
  -print decrypted password

=end 

puts "Would you like to decrypt or encrypt a password?"
msg_type = gets.chomp

if msg_type == "decrypt"
  def decrypt(password)
  index= 0
  alpha = "abcdefghijklmnopqrstuvwxyz !"
  password=password.downcase
  while index < password.length
    if password[index] == "a"
    	password[index] = "z"
    elsif password[index] == " "
        password[index] = "!"
    else
    alpha_index_number = alpha.index(password[index])
    index_minus_1 = alpha_index_number - 1
    password[index] = alpha[index_minus_1]
    	end
    index +=1
  end
  return password
  end
  puts "What is your password you would like to decrypt?"
  pw = gets.chomp
  decrypt(pw)
  
elsif msg_type == "encrypt"
  def encrypt(password)
  index= 0
  while index < password.length
    password[index] = password[index].next
    index +=1
  end
    if password.include? "ab"
      return password.gsub!("ab", "a")
    else
      return password
    end
  end
  puts "What is your password you would like to encrypt?"
  pw = gets.chomp
  encrypt(pw)    

else
	puts "Are you a spy?!  Program will self destruct in..."
	puts "3..."
	puts "2..."
	puts "1..."
	puts "BOOM!"
end