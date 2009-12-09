class ContactsController < ApplicationController

	before_filter :check_signed_in

	def index
		@contacts = Contact.all(:order => "sort_key")
	end


	def search
		if @search_key = params[:search_key]
			@contacts = Contact.find(
				:all,
				:conditions => {:search_key => /#{@search_key.downcase}/},
				:order => 'sort_key'
			)
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
			flash[:notice] = 'Contact created.'
			redirect_to contact_url(@contact)
		else
			render :action => 'new'
		end
	end


	def update
		@contact = Contact.find(params[:id])

		if @contact.update_attributes(params[:contact])
			flash[:notice] = 'Contact updated.'
			redirect_to contact_url(@contact)
		else
			render :action => 'edit'
		end
	end


	def destroy
		@contact = Contact.find(params[:id])

		if @contact.destroy
			flash[:notice] = 'Contact deleted.'
		end

		redirect_to contacts_url
	end

end
