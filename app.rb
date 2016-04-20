require 'sinatra'
require 'mongoid'
require 'json'
require './peppers'

# Use mongoid as ODM and setup using the mongoid.yml file
# specifiy the environment from the yml
configure do
 Mongoid.load!("./mongoid.yml", :development)
end

# set the homepage
get '/' do
  "Cory's simple API using Ruby and Mongo"
end

get '/api/peppers' do
  # make a list of all the names of the peppers
  pepper_name_list = %w()
  Peppers.all.each do |pepper|
    pepper_name_list.push(pepper.name)
  end

  # get a count for fun and display different results depending on count
  peppers_count = Peppers.count
  if Peppers.count > 0
    "You have #{peppers_count} peppers in the Database here are the names: #{pepper_name_list.join(", ")}"
  else
    "You have no peppers in the database"
  end
end

post '/api/peppers' do
  # Parse the incoming data from the request object and
  # create a pepper in a peppers object
  data = JSON.parse request.body.read
  Peppers.create(data)
end

delete '/api/peppers' do
  # check if peppers exist, if they do delete them all.
  if Peppers.count > 0
    Peppers.delete_all
    puts "DELETING ALL"
  else
    puts "NOTHING TO DELETE"
  end
end

get '/api/peppers/:name' do
  # Pass in the names param on the end of the URL and find
  # the documents that match that name
  pepper_data = Peppers.where(name: params['name'])
  "#{pepper_data.to_json}"
end

