class ExportController < ApplicationController

	before_filter :check_signed_in

	def all
		@people = Person.all(:order => 'sort_key')
	end

end
