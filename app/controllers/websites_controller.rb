class WebsitesController < ApplicationController

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
		@website = Website.new
	end


	def edit
		@website = @person.websites.find(params[:id])
	end


	def create
		@website = Website.new(params[:website])
		@person.websites << @website

		if @person.save
			flash[:notice] = 'Website added.'
			redirect_to person_url(@person)
		else
			render :action => :new
		end
	end


	def update
		@website = @person.websites.find(params[:id])

		if @website.update_attributes(params[:webiste])
			flash[:notice] = 'Website updated.'
			redirect_to person_url(@person)
		else
			render :action => :edit
		end
	end


	def destroy
		@website = @person.websites.find(params[:id])

		if @person.websites.delete(@website)
			if @person.save
				flash[:notice] = 'website deleted.'
			end
		end

		redirect_to person_url(@person)
	end

end
