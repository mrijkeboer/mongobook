class InstantMessagingsController < ApplicationController

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
		@instant_messaging = InstantMessaging.new
	end


	def edit
		@instant_messaging = @contact.instant_messagings.find(params[:id])
	end


	def create
		@instant_messaging = InstantMessaging.new(params[:instant_messaging])
		@contact.instant_messagings << @instant_messaging

		if @contact.save
			redirect_to contact_url(@contact), :notice => 'Instant messaging added.'
		else
			render :action => :new
		end
	end


	def update
		@instant_messaging = @contact.instant_messagings.find(params[:id])

		if @instant_messaging.update_attributes(params[:instant_messaging])
			redirect_to contact_url(@contact), :notice => 'Instant messaging updated.'
		else
			render :action => :edit
		end
	end


	def destroy
		@instant_messaging = @contact.instant_messagings.find(params[:id])

		if @contact.instant_messagings.delete(@instant_messaging)
			if @contact.save
				flash.now[:notice] = 'Instant messaging deleted.'
			end
		end

		redirect_to contact_url(@contact)
	end

end
