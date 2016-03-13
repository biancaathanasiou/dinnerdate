require 'sinatra'
require 'twitter'
require 'pony'

set :server, 'webrick'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE


get('/') do
  erb :hello1
end


get('/venuepg1') do
	erb :venuepg1
end

get('/venuepg2') do
	erb :venuepg2
end

get('/venuepg3') do
	erb :venuepg3
end

get('/venuepg4') do
	erb :venuepg4
end

get('/twitter') do

	client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "dKTsPg7cdEWuQPklhf2PJtb0G"
    config.consumer_secret     = "1af5zynv8FERYpe33YJTwgHl7nqF1J5jCTezwWMIiiHRLoesgu"
    config.access_token        = "708683110150479873-OhnKKH26wNfJnyysgTp4iQJvNVoIkj6"
    config.access_token_secret = "bnDq58mgWaMspum3tHy9dCbCK4RMMZimbdM3vwChzanVM"

end

@name = params[:name]

client.update('#{@name} has booked for their #DinnerDate! Why not join them at http://dinnerdate.com')

erb :twitter

end


post('/confirmation') do

puts params[:name]
puts params[:email]
puts params[:occasion]
puts params[:guests]
puts params[:date]


@email = params[:email]
@name = params[:name]
@guests = params[:guests]
@date = params[:date]
@occasion = params[:occasion].downcase

Pony.options = {
	:via => 'smtp',
	:via_options => {
		:address => 'smtp.mailgun.org',
		:port => '587',
		:enable_starttls_auto => true,
		:authentication => :plain,
		# This is the Default SMTP Login from earlier:
		:user_name => 'postmaster@sandbox5a37e418ee9f47748057c8e40d6af588.mailgun.org',
		# This is your Default Password:
		:password => '7cb9d4ccc40900718ab1b29c580b2a38'
	}
}


message = {
	:from => 'hello@example.com',
	:to => "#{@name} <#{@email}>",
	:subject => "Your confirmation from Dinner Date, #{@name}!",
	:headers => { 'Content-Type' => 'text/html' },
	:body => erb(:email)
}

Pony.mail(message)

erb :emailconfirm


end

