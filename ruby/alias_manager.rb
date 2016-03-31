=begin
initialize letter swap method that takes a letter as a parameter
  create cipher vowel hash
  IF it's TRUE that the cipher has a key that matches the argument
    letter is reassigned to the matching cipher key's value
  ELSIF letter is "z"
  ELSIF letter is a consonant before a vowel
    letter is reassigned to the next consonant
  ELSE it must be a consonant that is not before a vowel
    letter is assigned to next letter
END of method
=end

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
  elsif letter == 'z'
    letter = 'b'
  elsif letter == 'd' || letter == 'h' || letter == 'n' || letter == 't' 
    letter.next.next
  else
    letter.next  
  end
end