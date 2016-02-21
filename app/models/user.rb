class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :comments, dependent: :delete_all

	class << self
		def from_omniauth(auth)
			provider = auth.provider
			uid = auth.uid
			info = auth.info.symbolize_keys!
			user = User.find_or_initialize_by(uid: uid, provider: provider)
			user.name = info.name
			user.avatar_url = info.image
			user.profile_url = info.urls.send(provider.capitalize.to_sym)
			user.email = info.email
			user.save!(validate: false)
			user
		end
	end
end
