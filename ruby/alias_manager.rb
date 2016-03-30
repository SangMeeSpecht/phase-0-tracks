puts "Please enter your full name."
name = gets.chomp
split_name = name.split("")

split_name.map! { |letter|
	if letter == "a" || letter == "e" || letter == "i" || letter == "o" || letter == "u"
		vowel = "uoiea"		
    	current_index = vowel.index(letter)
  		vowel[current_index - 1]
  	elsif letter == "A" || letter == "E" || letter == "I" || letter == "O" || letter == "U"
		vowel = "UOIEA"		
    	current_index = vowel.index(letter)
  		vowel[current_index - 1]
  	elsif letter == "d" || letter == "h" || letter == "n" || letter == "t"
  		letter.next.next
 	elsif letter == "D" || letter == "H" || letter == "N" || letter == "T"
  		letter.next.next
  	elsif letter == "z"
  		letter = "b"
  	elsif letter == "Z"
  		letter = "B"
  	elsif letter == " "
  		letter = " "
  	else
  		letter.next
	end
}

letter_switch = split_name.join("")
