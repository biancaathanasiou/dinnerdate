require 'Sinatra'
require 'Twitter'

set :server, 'webrick'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE


client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "dKTsPg7cdEWuQPklhf2PJtb0G"
    config.consumer_secret     = "1af5zynv8FERYpe33YJTwgHl7nqF1J5jCTezwWMIiiHRLoesgu"
    config.access_token        = "708683110150479873-OhnKKH26wNfJnyysgTp4iQJvNVoIkj6"
    config.access_token_secret = "bnDq58mgWaMspum3tHy9dCbCK4RMMZimbdM3vwChzanVM"
end

client.update("I'm posting a tweet!")

end
