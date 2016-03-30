puts "Please enter your full name."
name = gets.chomp
word_swap = name.split(" ")

word_swap.insert(0, word_swap.delete_at(1))
word_swap = word_swap.join(" ")

letter_swap = word_swap.split("")


letter_swap.map! { |letter|
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

letter_swap.join("")