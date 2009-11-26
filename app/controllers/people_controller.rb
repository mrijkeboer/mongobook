class PeopleController < ApplicationController

	before_filter :check_signed_in

	def index
		@people = Person.all(:order => "sort_key")
	end


	def show
		@person = Person.find(params[:id])
	end


	def new
		@person = Person.new
	end


	def edit
		@person = Person.find(params[:id])
	end


	def create
		@person = Person.new(params[:person])

		if @person.save
			flash[:notice] = 'Person created.'
			redirect_to person_url(@person)
		else
			render :action => 'new'
		end
	end


	def update
		@person = Person.find(params[:id])

		if @person.update_attributes(params[:person])
			flash[:notice] = 'Person updated.'
			redirect_to person_url(@person)
		else
			render :action => 'edit'
		end
	end


	def destroy
		@person = Person.find(params[:id])

		if @person.destroy
			flash[:notice] = 'Person deleted.'
		end

		redirect_to people_url
	end

end
