class TodoList
 def initialize(things_to_do)
 	@things_to_do = things_to_do
 end

 def get_items
 	@things_to_do
 end

 def get_item(chore_index)
 	@things_to_do[chore_index]
 end

 def add_item(new_chore)
 	@things_to_do << new_chore
 end

 def delete_item(chore_done)
 	@things_to_do.delete(chore_done)
 end
end

=begin 

Identify the components of an Rspec test:

* describe block: a block of code that contains what is being tested; inside the block, it will tell Rspec
				  the behavior of what is being tested
* it block: a block of code that contains an individual test that is run in isolation from other 'it blocks'
* expectation/matcher itself: the part inside the 'it block' that tells Rspec what it should expect
 							  as a result after running the given example (example: running a method with
 							  certain parameters)

=end