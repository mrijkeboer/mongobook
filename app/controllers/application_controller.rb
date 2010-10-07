class ApplicationController < ActionController::Base

	include SessionsHelper

  protect_from_forgery


	private


 	def find_contact
		contact_id = params[:contact_id]

		if contact_id == nil
			redirect_to contacts_url
		else
			@contact = Contact.find(contact_id)
		end
	end

end
