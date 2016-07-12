XingApi::Client.configure do |config|
  config.consumer_key = ENV['XING_TOKEN']
  config.consumer_secret = ENV['XING_SECRET']
end