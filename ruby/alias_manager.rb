=begin
initialize name swap method that takes a string (user's full name) as a parameter
  change each character in string to lowercase letters
  split string into two individual strings at every blank space
  swap first and second string
END of method

initialize letter swap method that takes a letter as a parameter
  create cipher vowel hash
  IF it's TRUE that the cipher has a key that matches the argument
    letter is reassigned to the matching cipher key's value
  ELSIF letter is "z"
  ELSIF letter is a consonant before a vowel
    letter is reassigned to the next consonant
  ELSE it must be a consonant that is not before a vowel
    letter is assigned to next letter
  END of conditional
END of method

status of whether user is done with program is  FALSE
empty array to store old and new names

loop UNTIL user inputs "quit"
  get input from user
  IF input is equivalent to "quit"
    done with program is TRUE
    END program
  ELSE
    call name swap method
    split name swap return value into individual strings 
    iterate through array and call letter swap method on each element
    join array strings back together
    capitalize the first character in each string
    add old and new name to a hash
    print new name 
    ask user to enter another name
  END of conditional
END of loop

print the old and new names hash
END program
=end

def name_swap(name)
  name.downcase!
  name = name.split(' ')
  name.insert(0, name.delete_at(1))
end

def letter_swap(letter)
  vowel_cipher = {
    'a' => 'e',  
    'e' => 'i', 
    'i' => 'o', 
    'o' => 'u', 
    'u' => 'a'
  }
  if vowel_cipher.has_key?(letter)
    letter = vowel_cipher[letter]
  elsif letter == ' '
  elsif letter == 'z'
    letter = 'b'
  elsif letter == 'd' || letter == 'h' || letter == 'n' || letter == 't' 
    letter.next.next
  else
    letter.next  
  end
end









