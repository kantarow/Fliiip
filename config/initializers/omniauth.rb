require 'dotenv'

Dotenv.load

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV["TWITTER_KEY"], ENV["TWITTER_SECRET"], callback_url: 'http://127.0.0.1:3000/auth/twitter/callback'
end
