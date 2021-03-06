=begin 
DESCRIPTION:
I've lived in Chicago for 4.5 years and have moved to 6 different apartments.  When I was moving, I relied 
heavily on different websites to search for a new place.  This is an attempt at a very primitive apartment 
hunter database.  Renters can search for apartments based on specific critera and add or delete apartments 
they're interested in, in a 'favorites' table (only if they create a username first).

PSEUDOCODE
==========DATA TABLES=========
use 'sqlite3' and 'faker' gems

create new database 

create 'landlords' table if it doesn't exist
	* integer primary key
	* name
	* neighborhood
	* rent price
	* number of bedrooms
	* number of bathrooms
	* parking availability
END

define method that returns random Chicago neighborhood
	* list of Chicago neighborhoods
	* randomly select one neighborhood
END of method

define method to insert data into 'landlords' table
	* populate 'landlords' table with fictional data with 'faker' gem
END

loop through method to make x number of rows for 'landlords' table
	* insert data into 'landlords' table
END

create 'renters' table if it doesn't exist
	* integer primary key
	* name
	*username
END

create 'favorites' table
	* integer primary key
	* foreign renters_id key
	* foreign landlords_id key
END

==========METHODS===========
define method to add new user into 'renters' table
	* insert name and username into 'renters' table
END of method

define method to check if username exists in 'renters' table
	* IF name is not unique
		*RETURN false
END of method

define method to list apartments from user's 'favorites' table (must have username)
	* LOOP through each row in 'favorite' list
		* print user's favorite apartments
	* END of loop
END of method

define method to delete apartment(s) from 'favorites' table
	* delete selected apartments from 'favorites' table
END of method

define method to gather apartment(s) that match their criteria
	* search through current row in the 'landlords' table for that particular user
			* prints row's apartment information
END of method 

define method to display apartments and give users with username option to save apartments
	* IF user has a username
		* LOOP through each row in 'landlords' table 
			* print apartments that match their criteria
			* ask if they would like to save apartment to 'favorites' table
				* insert listing into 'favorites' if "yes"
				* go onto next listing if "no"
		* END of loop
	* ELSE if they don't have a username
		* LOOP through each row in 'landlords' table
			* print apartments that match their criteria 
		* END of loop
	* END of conditional 
END of method

==========USER INTERFACE===========
ask user if they have a username
UNTIL they answer "yes" or "no"
	* IF "yes"
		* ask for username
	* ELSE IF "no"
		* ask if they would like to create one
			* IF "yes"
				* IF username exists
					* print "username already exists"
				* ELSE 
					* create new username and store in 'renters' table
				* END
			ELSE IF "no"
				* exit loop
			END of conditional
	ELSE
		* display error
	END of conditional 
END of until loop

UNTIL user inputs "quit"
	* print options 
	 * search apartments
	 * view 'favorites'
	 * delete 'favorites' 
	 * quit
	* WHEN user chooses to search apartments
		* ask user series of questions to narrow search
	* WHEN user chooses to view 'favorites'
		* print all of the 'favorites' from the 'favorites' table
	* WHEN user chooses delete 'favorites'
		* delete their 'favorites' from 'favorites' table
	* WHEN user chooses "quit"
		* break loop
	* END
* END of loop
=end

require "sqlite3"
require "faker"

db = SQLite3::Database.new("apartment_hunter.db")

=begin

# ===============DATA TABLES===============
# creates 'landlords' table 
create_landlord_table = <<-SQL
	CREATE TABLE IF NOT EXISTS landlords(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    neighborhood VARCHAR(255),
    rent INT,
    bedrooms INT,
    bathrooms INT,
    parking BOOLEAN
	)
SQL
 
db.execute(create_landlord_table)

# test (insert data into 'landlord' table)
db.execute("INSERT INTO landlords (name, neighborhood, rent, bedrooms, bathrooms, parking) VALUES ('Louise Hudson', 'Lakeview', 1200, 2, 1, 'true')")

# selects random Chicago neighborhood 
def hood_selector
	chicago = ["Albany Park", "Andersonville", "Avondale", "Beverly", "Boystown", "Bridgeport", "Bronzeville", 
						 "Chinatown", "Edgewater", "Gold Coast", "Humboldt Park", "Hyde Park", "Irving Park", "Jefferson Park", 
						 "Kenwood", "Lakeview", "Lincoln Park", "Lincoln Square", "Litte Italy & University Village", 
						 "Little Village", "Logan Square", "Loop", "Magnificent Mile", "North Center", "North Park", "Old Town", 
						 "Pilsen", "Portage Park", "Pullman", "River North", "Rogers Park", "Roscoe Village", "South Loop", 
						 "South Shore", "Streeterville", "Uptown", "West Loop", "West Ridge", "West Town", "Wicker Park/Bucktown", 
						 "Wrigleyville"]
  chicago.sample
end

# create and insert 'landlords' data
def create_landlords(db, name, neighborhood, rent, bedrooms, bathrooms, parking)
	db.execute("INSERT INTO landlords (name, neighborhood, rent, bedrooms, bathrooms, parking) VALUES (?, '#{neighborhood}', '#{rent}', '#{bedrooms}', '#{bathrooms}', '#{parking}')", [name])
end

# insert 99 landlords into 'landlords' table
99.times do
	create_landlords(db, Faker::Name.name, hood_selector, rand(500..5000), rand(0..5), rand(1..5), ["true", "false"].sample)
end

# creates 'renters' table
create_renter_table = <<-SQL
 CREATE TABLE IF NOT EXISTS renters(
   id INTEGER PRIMARY KEY,
   name VARCHAR(255),
   username VARCHAR(255)
	)
 SQL
 
db.execute(create_renter_table) 

# test (insert data into 'renters')
db.execute("INSERT INTO renters (name, username) VALUES ('Peggy Olsen', 'OlePeg')")

# creates 'favorites' table
create_favorites_table = <<-SQL
	CREATE TABLE IF NOT EXISTS favorites(
    id INTEGER PRIMARY KEY,
    renters_id INT,
    landlords_id INT,
    FOREIGN KEY (renters_id) REFERENCES renters(id)
    FOREIGN KEY (landlords_id) REFERENCES landlords(id)
	)
SQL
=end

# ===============METHODS===============
# creates new user in 'renters' table
def create_user(db, name, username)
	db.execute("INSERT INTO renters (name, username) VALUES (?, ?)", [name, username])
end

# checks if username already exists in 'renters' table
def username_checker(db, username)
	unique = db.execute("SELECT * FROM renters")
	unique.each do |user|
		if user[2] == username
			return false
		end
	end
end

# displays user's saved apartments in 'favorites' table
def current_favorites(db, un)
			puts "Here are your favorite apartments you've saved:"
			current_favs = db.execute("SELECT landlords.id, landlords.neighborhood, landlords.rent, landlords.bedrooms, landlords.bathrooms, landlords.parking FROM favorites JOIN landlords ON favorites.landlords_id = landlords.id WHERE favorites.renters_id = #{un}")
			current_favs.each do |fav|
				puts "\nLandlord ID: #{fav[0]}"
				puts "Neighborhood: #{fav[1]}"
				puts "Rent: #{fav[2]}"
				puts "Bedrooms: #{fav[3]}"
				puts "Bathrooms: #{fav[4]}"
				puts "Parking: #{fav[5]}"
			end
end

# deletes user's saved apartment in 'favorites' table
def delete_fav(db, un, response)
	response.to_i
	delete_fav = db.execute("DELETE FROM favorites WHERE landlords_id = #{response} AND renters_id = #{un}")
	puts "#{response} successfully deleted."
end

# searches through apartments and displays apartments that match the criteria
def search_results(db, hood, rent, bed, bath, park, un, apartment)
	if hood == apartment[2] && rent >= apartment[3] && bed <= apartment[4] && bath <= apartment[5] && park == apartment[6]
		puts
		puts "Neighborhood: #{apartment[2]}"
		puts "Rent: #{apartment[3]}"
		puts "Bedrooms: #{apartment[4]}"
		puts "Bathroooms: #{apartment[5]}"
		if apartment[6] == "true"
			puts "Parking: yes"
		else
			puts "Parking: no"
		end
	end
end

# searches through apartments that match criteria and saves user's apartments in 'favorites' table
def apt_search(db, hood, rent, bed, bath, park, un)
	all_rentals = db.execute("SELECT * FROM landlords")
	if un == ""
		puts "\nHere are your search results:"
		all_rentals.each do |apartment|
			search_results(db, hood, rent, bed, bath, park, un, apartment)
		end
	else
		puts "\nHere are your search results:"
		all_rentals.each do |apartment|
			if hood == apartment[2] && rent >= apartment[3] && bed <= apartment[4] && bath <= apartment[5] && park == apartment[6]
				search_results(db, hood, rent, bed, bath, park, un, apartment)
				puts "Would you like to add this listing to your favorites? (Y/N)"
				add = gets.chomp.upcase
				if add == "Y"
					db.execute("INSERT INTO favorites (renters_id, landlords_id) VALUES (?, #{apartment[0]})", [un])
				end
			end
		end
	end 
	puts "\nEnd of search."
end

# ============USER INTERFACE=============
puts "Welcome to the 'Apartment Hunter App' where we find the perfect Chicago apartment just for you!"
puts "Do you have an account? (Y/N)"
answer = ""

# "signs-in" user OR creates an account for user OR skips account creation 
until answer == "Y" || answer == "N"
	answer = gets.chomp.upcase
	if answer == "Y"
		un_valid = db.execute("SELECT * FROM renters")
		puts "Enter your username"
		existing_user = false
		until existing_user == true
				un = gets.chomp
				un_valid.each do |user|
					if user[2] == un
						puts "\nWelcome back #{user[2]}!"
						un = user[0]
						existing_user = true
					end
				end
			if existing_user == false
				puts "That user does not exist."
				puts "Error: Please enter a valid username."
			end
		end

	elsif answer == "N"
		puts "Would you like to create one? (Y/N)"
		answer2 = ""
		until answer2 == "Y" || answer2 == "N"
			answer2 = gets.chomp.upcase 
			if answer2 == "Y"
				puts "Enter your name"
				name = gets.chomp
				puts "Enter a username"
				is_unique = false
				until is_unique == true
					un = gets.chomp
					un_checker = username_checker(db, un)
					if un_checker == false
						puts "That username already exists.  Please choose another username."
					else
						create_user(db, name, un)
						puts "You've successfully created an account."
						break
					end
				end
			elsif answer2 == "N"
				puts "Any rental search favorites will not be saved"
				un = ""
			else 
				puts "Error: Please enter 'Y' or 'N'."
			end
		end

	else 
		puts "Error: Please enter 'Y' or 'N'."
	end
end

# user options 
puts "\nWhat what would you like to do? (1-4)"
option = ""

until option == 4 
	puts "1  Search for apartments"
	puts "2  Display 'favorite' apartments (username required)"
	puts "3  Delete items in 'favorite' apartments (username required)"
	puts "4  Quit"
	option = gets.chomp.to_i

	case option 
	when 1
		puts "\nPlease fill in the criteria below to get your apartment search started."
		puts "\nWhat is your desired neighborhood?"
		puts "Albany Park, Andersonville, Avondale, Beverly, Boystown, Bridgeport, Bronzeville, Chinatown" 
		puts "Edgewater, Gold Coast, Humboldt Park, Hyde Park, Irving Park, Jefferson Park, Kenwood, Lakeview" 
		puts "Lincoln Park, Lincoln Square, Litte Italy & University Village, Little Village, Logan Square, Loop"
		puts "Magnificent Mile, North Center, North Park, Old Town, Pilsen, Portage Park, Pullman, River North"
		puts "Rogers Park, Roscoe Village, South Loop, South Shore, Streeterville, Uptown, West Loop, West Ridge"
		puts "West Town, Wicker Park/Bucktown, Wrigleyville"
		puts	
		neighborhood = gets.chomp
		
		puts "What is the maximum monthly rent you would like to pay?"
		price = gets.chomp.to_i
		
		puts "What is the minimum number of bedrooms would you like?"
		bedroom = gets.chomp.to_i
		
		puts "What is the minimum number of bathrooms would you like?"
		bathroom = gets.chomp.to_i
		
		puts "Is parking desired? (Y/N)"
		parking = gets.chomp.upcase
		if parking == "Y"
			parking = "true"
		else
			parking = "false"
		end
		apt_search(db, neighborhood, price, bedroom, bathroom, parking, un)
	
	when 2
		current_favorites(db, un)
	
	when 3
		puts "Enter the landlord ID of the apartment you would like to remove from your favorites list."
		puts "If you are done deleting, enter 'quit'."
		response = ""
		until response == "quit"
			response = gets.chomp
			if response == "quit"
				break
			else
				delete_fav(db, un, response)
				puts "Please enter another landlord ID to delete.  If you are done, enter 'quit'."
			end
		end
	
	when 4
		puts "\nHappy apartment hunting!  Goodbye!"
		break
	else 
		puts "Error: input not recognized."
	end
puts "\nWhat else would you like to do?"
end
