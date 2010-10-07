module SessionsHelper

	def sign_in(user)
		session[:user_id] = user.id
		current_user = user
	end


	def sign_out
		session[:user_id] = nil
		current_user = nil
	end


	def current_user
		return @current_user ||= user_from_session
	end


	def check_signed_in
		unless current_user
			session[:orig_url] = request.fullpath
			redirect_to sign_in_url
		end
	end


	def check_user_count
		if User.count == 0
			redirect_to new_user_url
		end
	end


	def check_signed_in_and_user_count
		unless current_user
			if User.count > 0
				session[:orig_url] = request.fullpath
				redirect_to sign_in_url
			end
		end
	end


	private


	def current_user=(user)
		@current_user = user
	end


	def user_from_session
		if user_id = session[:user_id]
			return User.find(user_id)
		else
			return nil
		end
	end


end
