require File.expand_path("../../test_helper", __FILE__)
require File.expand_path("../../factory", __FILE__)

class WelcomeControllerTest < ActionController::TestCase

	#
	# index
	#
	test "on GET to :index should redirect to sign_in" do
		get :index
		assert_redirected_to sign_in_path
	end


	#
	# sign_in
	#
	test "on GET to :sign_in with no users in DB should redirect to new_user" do
		get :sign_in
		assert_redirected_to new_user_path
	end


	test "on GET to :sign_in should get sign_in page" do
		Factory.user!
		get :sign_in
		assert_template :sign_in
		assert_response :success
	end


	test "on POST to :sign_in should redirect to contacts" do
		user = Factory.user!(:password => 'password', :password_confirmation => 'password')
		post :sign_in, {:username => user.username, :password => 'password'}
		assert_redirected_to contacts_path
	end


	test "on POST to :sign_in with wrong password should show sign_in" do
		user = Factory.user!(:password => 'password', :password_confirmation => 'password')
		post :sign_in, {:username => user.username, :password => 'wrongpassword'}
		
		assert_template :sign_in
		assert_response :success
		assert_equal "Invalid username/password combination", flash[:error]
	end	


	#
	# sign_out
	#
	test "on GET to :sign_out should redirect to sign_in" do
		get :sign_out
		assert_redirected_to sign_in_path
	end

end
