class WelcomeController < ApplicationController

	before_filter :check_user_count, :only => :sign_in
	before_filter :check_signed_in, :except => :sign_in


	def index
		redirect_to sign_in_url
	end


	def sign_in
		session[:user_id] = nil

		if request.post?
			@user = User.sign_in(params[:username], params[:password])
			if @user != nil
				uri = session[:orig_uri] || contacts_url

				session[:user_id] = @user.id
				session[:orig_uri] = nil
				redirect_to uri
			else
				flash.now[:error] = "Invalid username/password combination"
			end
		end
	end


	def sign_out
		session[:user_id] = nil
		session[:orig_url] = nil
		redirect_to sign_in_url
	end


	private


	def check_user_count
		if User.count == 0
			redirect_to new_user_url
		end
	end

end
