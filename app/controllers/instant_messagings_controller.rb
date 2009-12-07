class InstantMessagingsController < ApplicationController

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
		@instant_messaging = InstantMessaging.new
	end


	def edit
		@instant_messaging = @person.instant_messagings.find(params[:id])
	end


	def create
		@instant_messaging = InstantMessaging.new(params[:instant_messaging])
		@person.instant_messagings << @instant_messaging

		if @person.save
			flash[:notice] = 'Instant messaging added.'
			redirect_to person_url(@person)
		else
			render :action => :new
		end
	end


	def update
		@instant_messaging = @person.instant_messagings.find(params[:id])

		if @instant_messaging.update_attributes(params[:instant_messaging])
			flash[:notice] = 'Instant messaging updated.'
			redirect_to person_url(@person)
		else
			render :action => :edit
		end
	end


	def destroy
		@instant_messaging = @person.instant_messagings.find(params[:id])

		if @person.instant_messagings.delete(@instant_messaging)
			if @person.save
				flash[:notice] = 'Instant messaging deleted.'
			end
		end

		redirect_to person_url(@person)
	end

end
