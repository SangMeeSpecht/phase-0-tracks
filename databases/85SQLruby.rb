=begin
DESCRIPTION:
I've lived in Chicago for 4.5 years and have moved to 6 different apartments.  When I was moving, I relied heavily on different websites to search for a new place.  This is an attempt at a primitive apartment hunter database.  Renters can search for apartments based on specified critera, add apartments that they're interested in, and landlords can list place(s) they want to rent.    

PSEUDOCODE

require 'sqlite3' and 'faker' gems

create new SQLite3 database and save in variable
save data items in hash

LANDLORD TABLE
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

RENTERS TABLE
create 'renters' table (if is doesn't already exist) and save in variable
  * see schema for content
END of table

=end

require "sqlite3"
require "faker"

db = SQLite3::Database.new("apartment_hunter.db")
db.results_as_hash = true

# LANDLORD DATA
# create_landlord_table = <<-SQL
	# CREATE TABLE IF NOT EXISTS landlords(
    # id INTEGER PRIMARY KEY,
    # name VARCHAR(255),
    # neighborhood VARCHAR(255),
    # rent INT,
    # bedrooms INT,
    # bathrooms INT,
    # parking BOOLEAN
	# )
# SQL
# 
# db.execute(create_landlord_table)
# 
# test
# db.execute("INSERT INTO landlords (name, neighborhood, rent, bedrooms, bathrooms, parking) VALUES ('Louise Hudson', 'Lakeview', 1200, 2, 1, 'true')")
# 
# def hood_selector
	# chicago = ["Albany Park", "Andersonville", "Avondale", "Beverly", "Boystown", "Bridgeport", "Bronzeville", 
						 # "Chinatown", "Edgewater", "Gold Coast", "Humboldt Park", "Hyde Park", "Irving Park", "Jefferson Park", 
						 # "Kenwood", "Lakeview", "Lincoln Park", "Lincoln Square", "Litte Italy & University Village", 
						 # "Little Village", "Logan Square", "Loop", "Magnificent Mile", "North Center", "North Park", "Old Town", 
						 # "Pilsen", "Portage Park", "Pullman", "River North", "Rogers Park", "Roscoe Village", "South Loop", 
						 # "South Shore", "Streeterville", "Uptown", "West Loop", "West Ridge", "West Town", "Wicker Park/Bucktown", 
						 # "Wrigleyville"]
  # chicago.sample
# end
# 
# def create_landlords(db, name, neighborhood, rent, bedrooms, bathrooms, parking)
	# db.execute("INSERT INTO landlords (name, neighborhood, rent, bedrooms, bathrooms, parking) VALUES (?, '#{neighborhood}', '#{rent}', '#{bedrooms}', '#{bathrooms}', '#{parking}')", [name])
# end
# 
# 99.times do
	# create_landlords(db, Faker::Name.name, hood_selector, rand(500..5000), rand(0..5), rand(0..5), ["true", "false"].sample)
# end

 # RENTER DATA
 create_renter_table = <<-SQL
 CREATE TABLE IF NOT EXISTS renters(
   id INTEGER PRIMARY KEY,
   name VARCHAR(255),
   username VARCHAR(255),
   neighborhood VARCHAR(255),
   rent INT,
   bedrooms INT,
   bathrooms INT,
   parking BOOLEAN
	)
 SQL
 
 db.execute(create_renter_table)


