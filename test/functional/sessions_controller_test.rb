require File.expand_path("../../test_helper", __FILE__)
require File.expand_path("../../factory", __FILE__)

class SessionsControllerTest < ActionController::TestCase

	#
	# new
	#
	test "on GET to :new with no users in DB should redirect to new_user" do
		get :new
		assert_redirected_to new_user_path
	end


	test "on GET to :new should render new" do
		Factory.user!
		get :new
		assert_response :success
		assert_template :new
	end


	#
	# create
	#
	test "on POST to :create should redirect to contacts" do
		user = Factory.user!(:password => 'password', :password_confirmation => 'password')
		post :create, :session => {:username => user.username, :password => 'password'}
		assert_redirected_to contacts_path
	end


	test "on POST to :create with wrong password should show sign_in" do
		user = Factory.user!(:password => 'password', :password_confirmation => 'password')
		post :create, :session=> {:username => user.username, :password => 'wrongpassword'}
		
		assert_template :new
		assert_response :success
		assert_equal "Invalid username/password combination", flash[:error]
	end	


	#
	# destroy
	#
	test "on DELETE to :destroy should redirect to root" do
		delete :destroy
		assert_redirected_to root_path
	end


end
