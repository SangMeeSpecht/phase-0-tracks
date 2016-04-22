=begin
DESCRIPTION:
I've lived in Chicago for 4.5 years and have moved to 6 different apartments.  When I was moving, I relied 
heavily on different websites to search for a new place.  This is an attempt at a primitive apartment hunter 
database.  Renters can search for apartments based on specified critera and add or delete apartments 
they're interested in, in a 'favorites' table.

PSEUDOCODE

require 'sqlite3' and 'faker' gems

create new SQLite3 database and save in variable
save data items in hash

=======LANDLORD TABLE===========
create 'landlord' table (if is doesn't already exist) and save in variable
  * see schema for content
END of table

execute 'landlord' table 

define method to create fake 'landlord' data that takes table, 'landlord' username, and apartment details as arguments
	* insert fake data
END of method

define method that selects random Chicago neighborhood and takes an argument of database table and name
	list of Chicago neighborhoods
	select random neighborhood
END of method

99 times DO
	* add fake 'landlord' data to 'landlord' table using 'faker' gem
END of loop

=======RENTERS TABLE==========
create 'renters' table (if is doesn't already exist) and save in variable
  * see schema for content
END of table

define method that adds a username to renters table
	* insert name and username into renters database
END of method

========FAVORITES TABLE==========
create 'favorites' table (if is doesn't already exist) and save in variable
  * see schema for content
END of table

===========USER INTERFACE=========
print welcome message

ask user if they have an account
UNTIL user enters correct option
	* store answer in variable
	* IF yes
		* ask what username is
			* IF username exists
				* welcome user
			* ELSE
				* print that user does not exist
				* ask for their username again
			END of conditional 
		* ELSIF no
			* ask if they would like to create one
			* until user enters correct option
				* store answer in variable
				IF yes
					* ask what you would like username to be
						* IF username exists
							* print that username already exists
						* ELSE 
							* create new user in rentals table
						* END of conditional 
				ELSIF no
					* tell them they can search for apartments but their results will not be saved
				ELSE
					* ask for their answer again
				END of conditional
		END of conditional
END of loop

prompt for renter username
save answer in variable

prompt for desired neighborhood
save answer in variable

prompt for max monthly rent price
save answer in variable

prompt for number of bedrooms desired
save answer in variable

prompt for number of bathrooms desired
save answer in variable

prompt for parking
save answer in variable 
declare counter for index number

LOOP through landlord table
	if renter criteria is all equal to landlord data
		print array
	END of conditional
	add +1 to index counter
END of loop
=end

require "sqlite3"
require "faker"

db = SQLite3::Database.new("apartment_hunter.db")

=begin

# LANDLORD DATA
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

# test
db.execute("INSERT INTO landlords (name, neighborhood, rent, bedrooms, bathrooms, parking) VALUES ('Louise Hudson', 'Lakeview', 1200, 2, 1, 'true')")

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

def create_landlords(db, name, neighborhood, rent, bedrooms, bathrooms, parking)
	db.execute("INSERT INTO landlords (name, neighborhood, rent, bedrooms, bathrooms, parking) VALUES (?, '#{neighborhood}', '#{rent}', '#{bedrooms}', '#{bathrooms}', '#{parking}')", [name])
end

99.times do
	create_landlords(db, Faker::Name.name, hood_selector, rand(500..5000), rand(0..5), rand(0..5), ["true", "false"].sample)
end

# RENTER DATA
create_renter_table = <<-SQL
 CREATE TABLE IF NOT EXISTS renters(
   id INTEGER PRIMARY KEY,
   name VARCHAR(255),
   username VARCHAR(255)
	)
 SQL
 
db.execute(create_renter_table) 
# test
db.execute("INSERT INTO renters (name, username) VALUES ('Peggy Olsen', 'OlePeg')")
=end
def create_user(db, name, username)
	db.execute("INSERT INTO renters (name, username) VALUES (?, ?)", [name, username])
end

def username_checker(db, username)
	unique = db.execute("SELECT * FROM renters")
	unique.each do |user|
		if user[2] == username
			return false
		end
	end
end
=begin
# FAVORITES DATA
create_favorites_table = <<-SQL
	CREATE TABLE IF NOT EXISTS favorites(
    id INTEGER PRIMARY KEY,
    renters_id INT,
    landlords_id INT,
    FOREIGN KEY (renters_id) REFERENCES renters(id)
    FOREIGN KEY (landlords_id) REFERENCES landlords(id)
	)
SQL
db.execute(create_favorites_table) 
=end
def add_to_fav(db, hood, rent, bed, bath, park)
	all_rentals = db.execute("SELECT * FROM landlords")
	all_rentals.each do |apartment|
		if hood == apartment[2] && rent >= apartment[3] && bed <= apartment[4] && bath <= apartment[5] && park == apartment[6]
			puts
			puts "neighborhood: #{apartment[2]}"
			puts "rent: #{apartment[3]}"
			puts "bedrooms: #{apartment[4]}"
			puts "bathroooms: #{apartment[5]}"
			puts "parking: #{apartment[6]}"
			puts "Would you like to add this listing to your favorites? (Y/N)"
			add_to_fav = gets.chomp.upcase
					if add_to_fav == "Y"
						db.execute("INSERT INTO favorites (renters_id, landlords_id) VALUES (#{un}, #{apartment[0]})")
			end
		end
	end
end

#============USER INTERFACE=============


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
						puts "Welcome back #{user[2]}!"
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
					username = gets.chomp
					un_checker = username_checker(db, username)
					if un_checker == false
						puts "That username already exists.  Please choose another username."
					else
						create_user(db, name, username)
						puts "You've successfully created an account."
						break
					end
				end
			elsif answer2 == "N"
				puts "Any rental search favorites will not be saved"
			else 
				puts "Error: Please enter 'Y' or 'N'."
			end
		end

	else 
		puts "Error: Please enter 'Y' or 'N'."
	end
end

# renter criteria questionaire 


puts "What is your desired neighborhood?"
neighborhood = gets.chomp

puts "What is the maximum monthly rent you would like to pay?"
price = gets.chomp.to_i

puts "How many bedrooms would you like?"
bedroom = gets.chomp.to_i

puts "How many bathrooms would you like?"
bathroom = gets.chomp.to_i

puts "Is parking desired? (Y/N)"
parking = gets.chomp.upcase
if parking == "Y"
	parking = "true"
else
	parking = "false"
end

add_to_fav(db, neighborhood, price, bedroom, bathroom, parking)








