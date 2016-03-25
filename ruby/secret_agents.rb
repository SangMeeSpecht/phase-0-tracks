=begin

An encrypt method that advances every letter of a string one letter forward.

create a variable with string that you're trying to encrypt.

define method in order to loop through string.
-utilize .length method so we know how many times to loop through.
-print each letter
-use .next method


So "abc" would become "bcd". For now, you can assume lowercase input and output. 

A decrypt method that reverses the process above. Note that Ruby doesn't have a built-in method for going backward one letter. How can you find out where a letter is in the alphabet, then access the letter right before it? Hint: In the IRB session above, you learned how to ask a string for the index of a letter. "abcdefghijklmnopqrstuvwxyz" counts as a string.

define method in order to loop through string
 -utilizie .length method so we know how many times to loop through
 -have some kind of counter to count how many times loop has completed
 -loop takes one letter at a time (in order) and changes it to the letter right before it (example: "b" would become "a")
 -puts letter on screen
 -does loop again as many times as needed

-variable with a string value of all alphabet letters in order
=end 

puts "Would you like to decrypt or encrypt a password?"
msg_type = gets.chomp

#START DECRYPTING

if msg_type == "decrypt"
  def decrypt(password)
  index= 0
  alpha = "abcdefghijklmnopqrstuvwxyz"
  while index < password.length
    password[index] = password[index].downcase
    if password[index] == "!"
      print " "
    elsif password[index] == " "
      print "!"
    else
    alpha_index_number = alpha.index(password[index])
    index_minus_1 = alpha_index_number - 1
      if index == 0
        print alpha[index_minus_1].capitalize
      else
       print alpha[index_minus_1]
      end
    end
    index +=1
  end
end
  
  puts "What is your password you would like to decrypt?"
  pw = gets.chomp
  decrypt(pw)

#STAR ENCRYPTING

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
end