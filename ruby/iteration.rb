def block_test
  x = "big"
  y = "wide"
  puts "this is a string"
  yield(x, y)
  puts "we have yielded to the block!"
end

block_test{|x, y| puts "this is a #{x} and #{y} block"}

## release 1

breakfast = ["toast", "eggs", "hash", "coffee"]
pairings = {
  wine: "cheese",
  jelly: "peanut buter",
  rice: "beans"
  }

p breakfast

breakfast.each {|food| puts "#{food} tastes good!!" }

p breakfast

breakfast.map! do |food|
  food + "es"
end

p breakfast

p pairings

pairings.each { |food1, food2| puts "#{food1} goes with #{food2}." }

p pairings