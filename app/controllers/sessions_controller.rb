class SessionsController < ApplicationController
	def create
		user = User.from_omniauth(request.env['omniauth.auth'])
		session[:user_id] = user.id
		flash[:success] = "Hello, #{user.name}!"
		redirect_to root_url
	end

	def destroy
		session.delete(:user_id)
		flash[:success] = "See you"
		redirect_to root_url
	end

	def auth_fail
		render text: "Failure"
	end
end
