class PhonesController < ApplicationController

	layout "people"

	before_filter :check_signed_in
	before_filter :find_person

	def index
		redirect_to person_url(@person)
	end


	def show
		redirect_to person_url(@person)
	end


	def new
		@phone = Phone.new
	end


	def edit
		@phone = @person.phones.find(params[:id])
	end


	def create
		@phone = Phone.new(params[:phone])
		@person.phones << @phone

		if @person.save
			flash[:notice] = 'Phone added.'
			redirect_to person_url(@person)
		else
			render :action => :new
		end
	end


	def update
		@phone = @person.phones.find(params[:id])

		if @phone.update_attributes(params[:phone])
			flash[:notice] = 'Phone updated.'
			redirect_to person_url(@person)
		else
			render :action => :edit
		end
	end


	def destroy
		@phone = @person.phones.find(params[:id])

		if @person.phones.delete(@phone)
			if @person.save
				flash[:notice] = 'Phone deleted.'
			end
		end

		redirect_to person_url(@person)
	end

end
