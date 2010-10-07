class SessionsController < ApplicationController

	before_filter :check_user_count, :only => :new

  def new
  end


  def create
		username = params[:session][:username]
		password = params[:session][:password]

		if user = User.sign_in(username, password)
			sign_in(user)
			uri = session[:orig_uri] || contacts_url
			session[:orig_uri] = nil
			redirect_to uri
		else
			flash.now[:error] = "Invalid username/password combination"
			render :action => "new"
		end
  end


  def destroy
		sign_out
		redirect_to root_url
  end


end
