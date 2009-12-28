require File.dirname(__FILE__) + "/../test_helper"
require File.dirname(__FILE__) + "/../factory"

class WelcomeControllerTest < ActionController::TestCase

	#
	# index
	#
	test "on GET to :index with no users in DB should redirect to new_user" do
		get :index
		assert_redirected_to new_user_path
	end


	test "on GET to :index should redirect to sign_in" do
		Factory.user!
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


	test "on POST to :sign_in with no users in DB should redirect to new_user" do
		post :sign_in
		assert_redirected_to new_user_path
	end


	test "on POST to :sign_in should redirect to contacts" do
		user = Factory.user!(:password => 'password', :password_confirmation => 'password')
		post :sign_in, {:username => user.username, :password => 'password'}
		assert_redirected_to contacts_path
	end


	#
	# sign_out
	#
	test "on GET to :sign_out with no users in DB should redirect to new_user" do
		get :sign_out
		assert_redirected_to new_user_path
	end

end
