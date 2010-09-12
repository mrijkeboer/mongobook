class ApplicationController < ActionController::Base

  protect_from_forgery


	private


	def check_signed_in
		unless @user = User.find(session[:user_id])
			session[:orig_url] = request.fullpath
			redirect_to sign_in_url
		end
	end


	def check_signed_in_and_user_count
		unless @user = User.find(session[:user_id])
			if User.count > 0
				session[:orig_url] = request.fullpath
				redirect_to sign_in_url
			end
		end
	end
	


 	def find_contact
		contact_id = params[:contact_id]

		if contact_id == nil
			redirect_to contacts_url
		else
			@contact = Contact.find(contact_id)
		end
	end

end
