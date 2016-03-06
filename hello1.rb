require 'sinatra'


get('/') do
  erb :hello
end

get('/twitter') do
  twitter_api = Twitter::REST::Client.new do |config|
	  config.consumer_key        = "qHLQaXq1TvWuU6tCYqhcfTP53"
	  config.consumer_secret     = "E1027APLZnxFGTx39m6LDfbeT30WrCwTJT5R4Fs4RC8DN7Vmz4"
	  config.access_token        = "29703751-8pefVB9fnoPBcTRnBuTomoUtuN2YE11vuXzwdAvtz"
	  config.access_token_secret = "YBzKoqqvgA04FqIdCmLlNYspS0uw1I5X2mvFDYYFCBb3L"
	end

	cfg_tweets = twitter_api.search("CodeFirstGirls")

	cfg_tweets.each do |tweet|
	  puts "#{tweet.user.screen_name}: #{tweet.text}"
	  erb :template


	end

end

get('/chefs') do
  erb :chefs
end

get('/billing') do
  erb :billingpage
end


get('/:name') do
  @name = params[:name].capitalize
  erb :hello
end


post('/venues') do
  puts params[:name]
  puts params[:email]
  puts params[:occasion]


 @email = params[:email]
 @name = params[:name]
 @occasion = params[:occasion].downcase
erb :venues

end

