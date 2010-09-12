class ContactsController < ApplicationController

	before_filter :check_signed_in

	def index
		@contacts = Contact.all(:order => "sort_key")
	end


	def search
		if @search_key = params[:search_key]
			@contacts = Contact.where(:search_key => /#{@search_key.to_s.downcase}/).sort(:sort_key)
		else
			@contacts = Array.new
		end
	end


	def show
		@contact = Contact.find(params[:id])
	end


	def new
		@contact = Contact.new
	end


	def edit
		@contact = Contact.find(params[:id])
	end


	def create
		@contact = Contact.new(params[:contact])

		if @contact.save
			redirect_to contact_url(@contact), :notice => 'Contact created.'
		else
			render :action => 'new'
		end
	end


	def update
		@contact = Contact.find(params[:id])

		if @contact.update_attributes(params[:contact])
			redirect_to contact_url(@contact), :notice => 'Contact updated.'
		else
			render :action => 'edit'
		end
	end


	def destroy
		@contact = Contact.find(params[:id])

		if @contact.destroy
			flash.now[:notice] = 'Contact deleted.'
		end

	ensure
		redirect_to contacts_url
	end

end
