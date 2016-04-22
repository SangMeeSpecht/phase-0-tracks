=begin 

==========LANDLORDS===========
==========RENTERS=============
==========FAVORITES===========


==========METHODS===========
define method to add apartment(s) to favorites list
define method to delete apartment(s) from favorites list
define method to display apartment(s) from favorite list


==========USER INTERFACE===========
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

def apt_search(db, hood, rent, bed, bath, park, un)
	all_rentals = db.execute("SELECT * FROM landlords")
	if un == ""
		all_rentals.each do |apartment|
			if hood == apartment[2] && rent >= apartment[3] && bed <= apartment[4] && bath <= apartment[5] && park == apartment[6]
				puts
				puts "neighborhood: #{apartment[2]}"
				puts "rent: #{apartment[3]}"
				puts "bedrooms: #{apartment[4]}"
				puts "bathroooms: #{apartment[5]}"
				puts "parking: #{apartment[6]}"
			end
		end
	else
		all_rentals.each do |apartment|
			if hood == apartment[2] && rent >= apartment[3] && bed <= apartment[4] && bath <= apartment[5] && park == apartment[6]
				puts "Here are your search results:"
				puts "neighborhood: #{apartment[2]}"
				puts "rent: #{apartment[3]}"
				puts "bedrooms: #{apartment[4]}"
				puts "bathroooms: #{apartment[5]}"
				puts "parking: #{apartment[6]}"
				puts "Would you like to add this listing to your favorites? (Y/N)"
				add = gets.chomp.upcase
				if add == "Y"
					db.execute("INSERT INTO favorites (renters_id, landlords_id) VALUES (#{un}, #{apartment[0]})")
				end
			end
		end
	end 
end

#============USER INTERFACE=============
puts "Welcome to the Apartment Hunter App where we find the perfect apartment just for you!"

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

puts "\nWhat what would you like to do? (1-4)"
option = ""

until option == 4 
	puts "1  Search for apartments"
	puts "2  Display 'favorite' apartments"
	puts "3  Delete items in 'favorite' apartments"
	puts "4  Quit"
	option = gets.chomp.to_i

	case option 
	when 1
		# renter criteria questionaire 
		puts "\nPlease fill in the criteria below to get your apartment search started."
		
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
	
		apt_search(db, neighborhood, price, bedroom, bathroom, parking, un)
	when 2
		puts db.execute("\nSELECT landlords.id, landlords.neighborhood, landlords.rent, landlords.bedrooms, landlords.bathrooms, landlords.parking FROM favorites JOIN landlords ON favorites.landlords_id = landlords.id WHERE favorites.renters_id = #{un};")
	when 3
	when 4
		puts "Goodbye!"
		break
	else 
		puts "I don't understand that command"
	end

puts "\nWhat else would you like to do?"
end





