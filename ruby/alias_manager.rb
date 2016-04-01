=begin
initialize name swap method that takes a string (user's full name) as a parameter
  change each character in string to lowercase letters
  split string into two individual strings at every blank space
  swap first and second string
  join strings together
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
  name = name.split(" ")
  name.insert(0, name.delete_at(1))
  name.join(" ")
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
    letter = ' '
  elsif letter == 'z'
    letter = 'b'
  elsif letter == 'd' || letter == 'h' || letter == 'n' || letter == 't' 
    letter.next.next
  else
    letter.next  
  end
end

finished = false 
id_list = {}

until finished == true
  old_name = gets.chomp
  if old_name == "quit"
    puts "Thank you for using the Alias Management System.  Goodbye!"
    old_name = true 
  else
    swap_name = name_swap(old_name)
    swap_name = swap_name.split("")
    swap_name.map! { |string| letter_swap(string)}
    swap_name = swap_name.join("")
    new_name = swap_name.split.map(&:capitalize).join(" ")
    puts new_name

    id_list[old_name] = new_name 

    puts "Please enter another name to be changed.  Enter 'quit' if finished."
  end
end

id_list.each { |old_name, new_name| puts "The secret identity of '#{old_name}' is '#{new_name}'" }







