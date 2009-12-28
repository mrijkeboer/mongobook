# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
	filter_parameter_logging :password


	private


	def check_user_count
		if User.count == 0
			redirect_to new_user_url
		end
	end


	def check_signed_in
		if @user = User.find(session[:user_id]) == nil
			session[:orig_url] = request.request_uri
			redirect_to sign_in_url
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
