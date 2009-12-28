class WebsitesController < ApplicationController

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
		@website = Website.new
	end


	def edit
		@website = @contact.websites.find(params[:id])
	end


	def create
		@website = Website.new(params[:website])
		@contact.websites << @website

		if @contact.save
			flash[:notice] = 'Website added.'
			redirect_to contact_url(@contact)
		else
			render :action => :new
		end
	end


	def update
		@website = @contact.websites.find(params[:id])

		if @website.update_attributes(params[:webiste])
			flash[:notice] = 'Website updated.'
			redirect_to contact_url(@contact)
		else
			render :action => :edit
		end
	end


	def destroy
		@website = @contact.websites.find(params[:id])

		if @contact.websites.delete(@website)
			if @contact.save
				flash[:notice] = 'Website deleted.'
			end
		end

		redirect_to contact_url(@contact)
	end

end
