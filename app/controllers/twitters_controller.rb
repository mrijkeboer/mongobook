class TwittersController < ApplicationController

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
		@twitter = Twitter.new
	end


	def edit
		@twitter = @contact.twitters.find(params[:id])
	end


	def create
		@twitter = Twitter.new(params[:twitter])
		@contact.twitters << @twitter

		if @contact.save
			flash[:notice] = 'Twitter added.'
			redirect_to contact_url(@contact)
		else
			render :action => :new
		end
	end


	def update
		@twitter = @contact.twitters.find(params[:id])

		if @twitter.update_attributes(params[:twitter])
			flash[:notice] = 'Twitter updated.'
			redirect_to contact_url(@contact)
		else
			render :action => :edit
		end
	end


	def destroy
		@twitter = @contact.twitters.find(params[:id])

		if @contact.twitters.delete(@twitter)
			if @contact.save
				flash[:notice] = 'Twitter deleted.'
			end
		end

		redirect_to contact_url(@contact)
	end

end
