Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook,'194350504263264', '57e795c09e6749b685f16efe882e0f27',
	scope: 'email', info_fields: 'email, name, link', display: 'page', image_size: 'square'

	provider :twitter, '6ur9iMZfZCRmp6xotSgrgUQVf', 'o1wF4dtm1Q7QIiNFH1myf1WowyxX3TFsqquBbLkl4N4VdJZfV7', image_size: 'normal'
end