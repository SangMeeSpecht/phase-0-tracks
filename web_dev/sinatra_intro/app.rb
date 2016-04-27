# require gems
require 'sinatra'
require 'sqlite3'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do
  "#{params[:name]} is #{params[:age]} years old."
end

# write a GET route with
# route parameters
get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end

# write a GET route that retrieves
# all student data
get '/students' do
  students = db.execute("SELECT * FROM students")
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end

# write a GET route that retrieves
# a particular student

get '/students/:id' do
  student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
  student.to_s
end

# =======RELEASE 0: ADD ROUTES============

# 1. write a GET route that displays an address
get '/contact' do
	address = params[:contact]
	"Address: #{address}"
end 
# http://127.0.0.1:9393/contact?contact=351WHubbardSt,Chicago,IL60654

# 2. write a GET route that takes a person's name as a query parameter 
# and say, "Good job, [person's name]!"
# If query parameter is not present, say, "Good job!"
get '/great_job' do
	name = params[:name]
	if name
		"Good job, #{name}!"
	else
		"Good job!"
	end
end
# http://127.0.0.1:9393/great_job?name=SangMee
# http://127.0.0.1:9393/great_job

# 3. write a GET route that uses route parameters to add two numbers
# and respond with the result
get 'add/:number_1/:number_2' do
	num1 = params[:number_1]
	num2 = params[:number_2]
	sum = num1.to_i + num2.to_i
	"#{num1} + #{num2} = #{sum}"
end
# hhttp://127.0.0.1:9393/100/add/200

# 4. BONUS: write a GET route that allows the user to search the database in some way
get '/studentlocal/:campus' do
	student = db.execute("SELECT * FROM students WHERE campus=?", [params[:campus]])
	student_list = ""
	student.each do |student|
    	student_list << "Name: #{student['name']}<br>"
    	student_list << "Campus: #{student['campus']}<br><br>"
  	end
  	student_list
end
# 
# =======RELEASE 1: ADD RESEARCH==========








