require File.expand_path("../../test_helper", __FILE__)
require File.expand_path("../../factory", __FILE__)

class UsersControllerTest < ActionController::TestCase

	def setup
		@account = Factory.user!
	end
	

	#
	# index
	#

	test "on GET to :index without user_id in the session should redirect to sign_in" do
		get :index
		assert_redirected_to sign_in_path
	end


	test "on GET to :index should show contacts" do
		get :index, nil, {:user_id => @account.id}
		assert_response :success
		assert_template :index
		assert_not_nil assigns(:users)
		assert_equal 1, assigns(:users).length
	end


	#
	# show
	#
	
	test "on GET to :show without user_id in the session should redirect to sign_in" do
		get :show, {:id => @account.id}
		assert_redirected_to sign_in_path
	end
		

	test "on GET to :show should redirect to users" do
		get :show, {:id => @account.id}, {:user_id => @account.id}
		assert_redirected_to users_path
	end


	#
	# new
	#

	test "on GET to :new without user_id in the session should redirect to sign_in" do
		get :new
		assert_redirected_to sign_in_path
	end


	test "on GET to :new should show new" do
		get :new, nil, {:user_id => @account.id}
		assert_response :success
		assert_template :new
		assert_not_nil assigns(:user)
	end


	test "on GET to :new with no users in DB should show new" do
		@account.delete

		get :new
		assert_response :success
		assert_template :new
		assert_not_nil assigns(:user)
	end


	#
	# edit
	#

	test "on GET to :edit without user_id in the session should redirect to sign_in" do
		get :edit, {:id => @account.id}
		assert_redirected_to sign_in_path
	end


	test "on GET to :edit should show edit" do
		get :edit, {:id => @account.id}, {:user_id => @account.id}
		assert_response :success
		assert_template :edit
		assert_not_nil assigns(:user)
	end


	# 
	# create
	#

	test "on POST to :create without user_id in the session should redirect to sign_in" do
		post :create, {:user => Factory.user_attributes}
		assert_redirected_to sign_in_path
	end


	test "on POST to :create should create user" do
		assert_difference('User.count', 1) do
			post :create, {:user => {:username => 'user2', :password => 'password', :password_confirmation => 'password'}}, {:user_id => @account.id}
		end

		assert_equal "User created.", flash[:notice]
	end


	test "on POST to :create with no users in DB should create user" do
		@account.delete

		assert_difference('User.count', 1) do
			post :create, {:user => Factory.user_attributes}
		end

		assert_equal "User created.", flash[:notice]
	end


	#
	# update
	#

	test "on PUT to :update without user_id in the session should redirect to sign_in" do
		put :update, {:id => @account.id}, nil, :user => { }
		assert_redirected_to sign_in_path
	end


	test "on PUT to :update should update user" do
		put :update, {:id => @account.id, :user => {:password => 'passwd', :password_confirmation => 'passwd'}}, {:user_id => @account.id}
		assert_redirected_to users_path
		assert_equal "User updated.", flash[:notice]
	end


	#
	# destroy
	#

	test "on DELETE to :destroy without user_id in the session should redirect to sign_in" do
		delete :destroy, {:id => @account.id}
		assert_redirected_to sign_in_path
	end


	test "on DELETE to :destroy should delete user" do
		assert_difference('User.count', -1) do
			delete :destroy, {:id => @account.id}, {:user_id => @account.id}
		end

		assert_redirected_to users_path
		assert_equal "User deleted.", flash[:notice]
	end

end
