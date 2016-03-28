# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.

# "iNvEsTiGaTiOn".<???>
"iNvEsTiGaTiOn".swapcase
"iNvEsTiGaTiOn".swapcase!
"iNvEsTiGaTiOn".replace("InVeStIgAtIoN")
# => “InVeStIgAtIoN”

# "zom".<???>
"zom".insert(2, "o")
"zom"replace("zoom")
# => “zoom”

# "enhance".<???>
"enhance".center(15)
"enhance".center(15, "    ")
"enhance".replace("    enhance    ")
# => "    enhance    "

# "Stop! You’re under arrest!".<???>
"Stop! You’re under arrest!".upcase
"Stop!  You're under arrest!".replace("STOP! YOU'RE UNDER ARREST!")
# => "STOP! YOU’RE UNDER ARREST!"

# "the usual".<???>
"the usual" << " suspects"
"the usual".insert(9, " suspects")
"the usual".replace("the usual suspects")
#=> "the usual suspects"

# " suspects".<???>
" suspects".insert(0, "the usual")
" suspects".prepend("the usual")
" suspects".replace("the usual suspects")
# => "the usual suspects"

# "The case of the disappearing last letter".<???>
"The case of the disappearing last letter".chop
"The case of the disappearing last letter".chop!
"The case of the disappearing last letter".replace("The case of the disappearing last lette")
# => "The case of the disappearing last lette"

# "The mystery of the missing first letter".<???>
"The mystery of the missing first letter".slice("he mystery of the missing first letter")
"The mystery of the missing first letter".slice(1..-1)
"The mystery of the missing first letter".delete("T")
"The mystery of the missing first letter".gsub("T", "")
"The mystery of the missing first letter".gsub!("T", "")
"The mystery of the missing first letter".sub("T", "")
"The mystery of the missing first letter".sub!("T", "")
"The mystery of the missing first letter".replace("he mystery of the missing first letter")
# => "he mystery of the missing first letter"
			  2   4    3       6
# "Elementary,    my   dear        Watson!".<???>
"Elementary  ,    my   dear      Watson!".replace("Elementary, my dear Watson!")
# => "Elementary, my dear Watson!"

# "z".<???>
"z".ord
# => 122 
# (What is the significance of the number 122 in relation to the character z?)

# "How many times does the letter 'a' appear in this string?".<???>
"How many times does the letter 'a' appear in this string?".count("a")
# => 4
