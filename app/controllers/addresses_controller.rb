class AddressesController < ApplicationController

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
		@address = Address.new
	end


	def edit
		@address = @contact.addresses.find(params[:id])
	end


	def create
		@address = Address.new(params[:address])
		@contact.addresses << @address

		if @contact.save
			redirect_to contact_url(@contact), :notice => 'Address added.'
		else
			render :action => :new
		end
	end


	def update
		@address = @contact.addresses.find(params[:id])

		if @address.update_attributes(params[:address])
			redirect_to contact_url(@contact), :notice => 'Address updated.'
		else
			render :action => :edit
		end
	end


	def destroy
		@address = @contact.addresses.find(params[:id])

		if @contact.addresses.delete(@address)
			if @contact.save
				flash.now[:notice] = 'Address deleted.'
			end
		end

		redirect_to contact_url(@contact)
	end

end
