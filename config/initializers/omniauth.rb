OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	#provider :developer unless Rails.env.production?
	provider :twitter, ENV['SCA_KEY'], ENV['SCA_SECRET']
end