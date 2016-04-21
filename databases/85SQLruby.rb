=begin
DESCRIPTION:
I've lived in Chicago for 4.5 years and have moved to 6 different apartments.  When I was moving, I relied heavily on different websites to search for a new place.  This is an attempt at a primitive apartment hunter database.  Renters can search for apartments based on specified critera, add apartments that they're interested in, and landlords can list place(s) they want to rent.    

PSEUDOCODE

require 'sqlite3' and 'faker' gems

create new SQLite3 database and save in variable
save data items in hash

create 'landlord' table (if is doesn't already exist) and save in variable
  * see schema for content
  * END of table

execute 'landlord' table 

define method to create fake 'landlord' data that takes table, 'landlord' username, and apartment details as arguments
	* insert fake data
END of method

100 times DO
	* list of Chicago neighborhoods (won't be able to use 'faker' gem for this)
	* add fake 'landlord' data to 'landlord' table using 'faker' gem
END of loop

=end

require "sqlite3"
require "faker"

db = SQLite3::Database.new("apartment_hunter.db")
db.results_as_hash = true

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






