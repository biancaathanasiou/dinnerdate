require 'sinatra'
require 'pony'


get('/') do
  erb :hello1
end

get('/twitter') do
  twitter_api = Twitter::REST::Client.new do |config|
	  config.consumer_key        = "qHLQaXq1TvWuU6tCYqhcfTP53"
	  config.consumer_secret     = "E1027APLZnxFGTx39m6LDfbeT30WrCwTJT5R4Fs4RC8DN7Vmz4"
	  config.access_token        = "29703751-8pefVB9fnoPBcTRnBuTomoUtuN2YE11vuXzwdAvtz"
	  config.access_token_secret = "YBzKoqqvgA04FqIdCmLlNYspS0uw1I5X2mvFDYYFCBb3L"
	end
twitter_api.update("i tweeted")
	cfg_tweets = twitter_api.search("CodeFirstGirls")

	cfg_tweets.each do |tweet|
	  puts "#{tweet.user.screen_name}: #{tweet.text}"

	  erb :template


	end

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


#
#   twitter_api = Twitter::REST::Client.new do |config|
# 	  config.consumer_key        = "qHLQaXq1TvWuU6tCYqhcfTP53"
# 	  config.consumer_secret     = "E1027APLZnxFGTx39m6LDfbeT30WrCwTJT5R4Fs4RC8DN7Vmz4"
# 	  config.access_token        = "29703751-8pefVB9fnoPBcTRnBuTomoUtuN2YE11vuXzwdAvtz"
# 	  config.access_token_secret = "YBzKoqqvgA04FqIdCmLlNYspS0uw1I5X2mvFDYYFCBb3L"
# 	end
# twitter_api.update("#{@name} has booked #{@location} for their #DinnerDate! Why not join them? dinnerdate.com")
# 	cfg_tweets = twitter_api.search("CodeFirstGirls")

# 	cfg_tweets.each do |tweet|
# 	  puts "#{tweet.user.screen_name}: #{tweet.text}"

# 	  erb :template


# 	end


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
