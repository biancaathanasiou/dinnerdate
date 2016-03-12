require 'Twitter'

client = Twitter::REST::Client.new do |config|
	  config.consumer_key        = "qHLQaXq1TvWuU6tCYqhcfTP53"
	  config.consumer_secret     = "E1027APLZnxFGTx39m6LDfbeT30WrCwTJT5R4Fs4RC8DN7Vmz4"
	  config.access_token        = "29703751-8pefVB9fnoPBcTRnBuTomoUtuN2YE11vuXzwdAvtz"
	  config.access_token_secret = "YBzKoqqvgA04FqIdCmLlNYspS0uw1I5X2mvFDYYFCBb3L"
end

client.update("I'm posting a tweet!")