class ExportController < ApplicationController

	before_filter :check_signed_in

	def all
		@contacts = Contact.all(:order => 'sort_key')
	end

end
