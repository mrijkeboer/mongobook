class UsersController < ApplicationController

	before_filter :check_signed_in, :except => [:new, :create]
	before_filter :check_signed_in_and_user_count, :only => [:new, :create]


	def index
		@users = User.all(:order => 'username')
	end


	def show
		redirect_to users_url
	end


	def new
		@user = User.new
	end


	def edit
		@user = User.find(params[:id])
	end


	def create
		@user = User.new(params[:user])

		if @user.save
			flash[:notice] = 'User created.'
			redirect_to users_url
		else
			render :action => 'new'
		end
	end


	def update
		@user = User.find(params[:id])

		if @user.update_attributes(params[:user])
			flash[:notice] = 'User updated.'
			redirect_to users_url
		else
			render :action => 'edit'
		end
	end


	def destroy
		@user = User.find(params[:id])

		if @user.destroy
			flash[:notice] = 'User deleted.'
		end

		redirect_to users_url
	end


end
