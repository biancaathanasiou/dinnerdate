require 'sinatra'

get('/') do
  erb :welcomeguest
end

get('/:name') do
  @name = params[:name].capitalize
  erb :welcomeguest
end

get('/:name/:time') do
  @name = params[:name].capitalize
  @time = params[:time]
  erb :choosetime
end


post('/signup') do
  puts params[:name]
  puts params[:email]

erb :venues
 
end
