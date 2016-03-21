puts "What is the hamster's name?"
name = gets.chomp

puts "How loud is the hamster from a scale from 1 to 10?"
loud = gets.chomp.to_i

puts "What is the hamster's fur color?"
fur = gets.chomp

puts "Is he/she a good candidate for adoption?"
adopt = gets.chomp

puts "About how old is the hamster?"
age = gets.chomp

age = nil if age == ""

puts "#{name} is a #{loud} out of 10 and #{fur} in color."
puts "#{adopt}, #{name} might/might not be good for adoption because he is #{age} years old."