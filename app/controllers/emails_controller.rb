class EmailsController < ApplicationController

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
		@email = Email.new
	end


	def edit
		@email = @person.emails.find(params[:id])
	end


	def create
		@email = Email.new(params[:email])
		@person.emails << @email

		if @person.save
			flash[:notice] = 'Email added.'
			redirect_to person_url(@person)
		else
			render :action => :new
		end
	end


	def update
		@email = @person.emails.find(params[:id])

		if @email.update_attributes(params[:email])
			flash[:notice] = 'Email updated.'
			redirect_to person_url(@person)
		else
			render :action => :edit
		end
	end


	def destroy
		@email = @person.emails.find(params[:id])

		if @person.emails.delete(@email)
			if @person.save
				flash[:notice] = 'Email deleted.'
			end
		end

		redirect_to person_url(@person)
	end

end
