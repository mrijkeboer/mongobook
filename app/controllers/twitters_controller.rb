class TwittersController < ApplicationController

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
		@twitter = Twitter.new
	end


	def edit
		@twitter = @person.twitters.find(params[:id])
	end


	def create
		@twitter = Twitter.new(params[:twitter])
		@person.twitters << @twitter

		if @person.save
			flash[:notice] = 'Twitter added.'
			redirect_to person_url(@person)
		else
			render :action => :new
		end
	end


	def update
		@twitter = @person.twitters.find(params[:id])

		if @twitter.update_attributes(params[:twitter])
			flash[:notice] = 'Twitter updated.'
			redirect_to person_url(@person)
		else
			render :action => :edit
		end
	end


	def destroy
		@twitter = @person.twitters.find(params[:id])

		if @person.twitters.delete(@twitter)
			if @person.save
				flash[:notice] = 'Twitter deleted.'
			end
		end

		redirect_to person_url(@person)
	end

end
