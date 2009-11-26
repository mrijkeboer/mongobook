class AddressesController < ApplicationController

	before_filter :check_signed_in
	before_filter :find_person

	def index
		redirect_to person_url(@person)
	end


	def show
		redirect_to person_url(@person)
	end


	def new
		@address = Address.new
	end


	def edit
		@address = @person.addresses.find(params[:id])
	end


	def create
		@address = Address.new(params[:address])
		@person.addresses << @address

		if @person.save
			flash[:notice] = 'Address created.'
			redirect_to person_url(@person)
		else
			render :action => :new
		end
	end


	def update
		@address = @person.addresses.find(params[:id])

		if @address.update_attributes(params[:address])
			flash[:notice] = 'Address updated.'
			redirect_to person_url(@person)
		else
			render :action => :edit
		end
	end


	def destroy
		@address = @person.addresses.find(params[:id])

		if @person.addresses.delete(@address)
			if @person.save
				flash[:notice] = 'Address deleted.'
			end
		end

		redirect_to person_url(@person)
	end

end
