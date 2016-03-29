puts "Please enter your full name."
name = gets.chomp


split_name = name.split("")
split_name.map! { |letter|
	case letter
	  when "a" then letter = "e"
	  when "e" then letter = "i"
	  when "i" then letter = "o"
	  when "o" then letter = "u"
	  when "u" then letter = "a"
	  when " " then letter = " "
	  else letter.next
	end
}

