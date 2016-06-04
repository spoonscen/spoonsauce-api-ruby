require 'sinatra'
require 'mongoid'
require 'json'
require 'rest_client'
require './peppers'

# Use mongoid as ODM and setup using the mongoid.yml file
# specifiy the environment from the yml
configure do
 Mongoid.load!("./mongoid.yml", :development)
end

# set the homepage
get '/' do
  File.read(File.join('public', 'index.html'))


end

get '/api/peppers' do
  content_type :json
  { data: Peppers.all }.to_json
end

post '/api/peppers' do
  Peppers.create(JSON.parse request.body.read)
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

get '/api/peppers/:id' do
  puts Peppers.where(id: params['id'])
  content_type :json
  { data: Peppers.where(id: params['id']) }.to_json
end

get '/peppers/:id' do
  puts Peppers.where(id: params['id'])
  content_type :json
  { data: Peppers.where(id: params['id']) }.to_json
end

delete '/api/peppers/:id' do
  Peppers.where(id: params['id']).delete
end

# not_found do
#   content_type :json
#   halt 404, { error: 'URL not found' }.to_json
# end