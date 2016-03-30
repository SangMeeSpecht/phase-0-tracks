# Release 0
def block_test
  x = "big"
  y = "wide"
  puts "this is a string"
  yield(x, y)
  puts "we have yielded to the block!"
end

block_test{|x, y| puts "this is a #{x} and #{y} block"}

# Release 1
breakfast = ["toast", "eggs", "hash", "coffee"]

pairings = {
  wine: "cheese",
  jelly: "peanut buter",
  rice: "beans"
  }

p breakfast
breakfast.each {|food| puts "#{food} tastes good!!" }
p breakfast

p breakfast
breakfast.map! do |food|
  food + "es"
end
p breakfast

p pairings
pairings.each { |food1, food2| puts "#{food1} goes with #{food2}." }
p pairings

# Release 2
array = [1,2,3,4,5,6,7,8,9]

hash = {
  a: 1,
  b: 2,
  c: 3,
  d: 4,
  e: 5,
  f: 6,
  g: 7
  }

# 1
array.delete_if {|index| index > 5}
p array

hash.delete_if {|place, digit| place > :d}
p hash

# 2
array.keep_if { |index| index%2 != 0 }
p array

hash.keep_if { |place, digit| digit%2 == 0 }
p hash

# 3
array.select! {|index| index < 5}
p array

hash.select! { |place, digit| place < :e && digit > 2}
p hash

# 4
array.reject! { |index| index >= 6 }
p array 

hash.reject! { |place, digit| place > :e && digit < 7 }
p hash