OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	#provider :developer unless Rails.env.production?
	provider :twitter, ENV['SCA_KEY'], ENV['SCA_SECRET'] 
end
# This app has to authenticate itself to Twitter, 
# and it does that through these unique environment variables. 
# This is the part of the app that initializes Omniauth so that Omniauth is available
# and allows Twitter to interact with this app. 