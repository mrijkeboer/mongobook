class EmailsController < ApplicationController

	layout "contacts"

	before_filter :check_signed_in
	before_filter :find_contact

	def index
		redirect_to contact_url(@contact)
	end


	def show
		redirect_to contact_url(@contact)
	end


	def new
		@email = Email.new
	end


	def edit
		@email = @contact.emails.find(params[:id])
	end


	def create
		@email = Email.new(params[:email])
		@contact.emails << @email

		if @contact.save
			flash[:notice] = 'Email added.'
			redirect_to contact_url(@contact)
		else
			render :action => :new
		end
	end


	def update
		@email = @contact.emails.find(params[:id])

		if @email.update_attributes(params[:email])
			flash[:notice] = 'Email updated.'
			redirect_to contact_url(@contact)
		else
			render :action => :edit
		end
	end


	def destroy
		@email = @contact.emails.find(params[:id])

		if @contact.emails.delete(@email)
			if @contact.save
				flash[:notice] = 'Email deleted.'
			end
		end

		redirect_to contact_url(@contact)
	end

end
