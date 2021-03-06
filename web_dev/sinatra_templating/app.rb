# require gems
require 'sinatra'
require 'sqlite3'

set :public_folder, File.dirname(__FILE__) + '/static'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# show students on the home page
get '/' do
  @students = db.execute("SELECT * FROM students")
  erb :home
end

get '/students/new' do
  erb :new_student
end

get '/students/graduationinfo' do
	@students = db.execute("SELECT * FROM graduates")
  erb :grad_info
end

get '/students/graduation' do
  erb :student_grad
end

# create new students via
# a form
post '/students' do
  db.execute("INSERT INTO students (name, campus, age) VALUES (?,?,?)", [params['name'], params['campus'], params['age'].to_i])
  redirect '/'
end

post '/students/grad' do
	db.execute("INSERT INTO graduates (name, campus, graddate) VALUES (?,?,?)", [params['name'], params['campus'], params['graddate'].to_i])
  redirect '/students/graduationinfo'
end

# add static resources