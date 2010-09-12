class PhonesController < ApplicationController

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
		@phone = Phone.new
	end


	def edit
		@phone = @contact.phones.find(params[:id])
	end


	def create
		@phone = Phone.new(params[:phone])
		@contact.phones << @phone

		if @contact.save
			redirect_to contact_url(@contact), :notice => 'Phone added.'
		else
			render :action => :new
		end
	end


	def update
		@phone = @contact.phones.find(params[:id])

		if @phone.update_attributes(params[:phone])
			redirect_to contact_url(@contact), :notice => 'Phone updated.'
		else
			render :action => :edit
		end
	end


	def destroy
		@phone = @contact.phones.find(params[:id])

		if @contact.phones.delete(@phone)
			if @contact.save
				flash.now[:notice] = 'Phone deleted.'
			end
		end

		redirect_to contact_url(@contact)
	end

end
