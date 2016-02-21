Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook,'194350504263264', '57e795c09e6749b685f16efe882e0f27',
	scope: 'email', info_fields: 'email, name, link', display: 'page', image_size: 'square'

	provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET'], image_size: 'normal'
end