class ContactMethodsController < ApplicationController

	before_filter :check_signed_in
	before_filter :find_person

	def index
		redirect_to person_url(@person)
	end


	def show
		redirect_to person_url(@person)
	end


	def new
		@contact_method = ContactMethod.new
	end


	def edit
		@contact_method = @person.contact_methods.find(params[:id])
	end


	def create
		@contact_method = ContactMethod.new(params[:contact_method])
		@person.contact_methods << @contact_method

		if @person.save
			flash[:notice] = 'Contact method created.'
			redirect_to person_url(@person)
		else
			render :action => :new
		end
	end


	def update
		@contact_method = @person.contact_methods.find(params[:id])

		if @contact_method.update_attributes(params[:contact_method])
			flash[:notice] = 'Contact method updated.'
			redirect_to person_url(@person)
		else
			render :action => :edit
		end
	end


	def destroy
		@contact_method = @person.contact_methods.find(params[:id])

		if @person.contact_methods.delete(@contact_method)
			if @person.save
				flash[:notice] = 'Contact method deleted.'
			end
		end

		redirect_to person_url(@person)
	end

end
