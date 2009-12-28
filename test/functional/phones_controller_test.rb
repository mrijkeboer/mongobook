require File.dirname(__FILE__) + "/../test_helper"
require File.dirname(__FILE__) + "/../factory"

class PhonesControllerTest < ActionController::TestCase

	def setup
		@user = Factory.user!
		@phone = Factory.phone!
		@contact = @phone.contact
	end


	#
	# index
	#

	test "on GET to :index without user_id in the session should redirect to sign_in" do
		get :index, {:contact_id => @contact.id}
		assert_redirected_to sign_in_path
	end


	test "on GET to :index should redirect to contacts" do
		get :index, {:contact_id => @contact.id}, {:user_id => @user.id}
		assert_redirected_to contact_path(@contact)
	end


	#
	# show
	#
	
	test "on GET to :show without user_id in the session should redirect to sign_in" do
		get :show, {:contact_id => @contact.id, :id => @phone.id}
		assert_redirected_to sign_in_path
	end
		

	test "on GET to :show should redirect to contacts" do
		get :show, {:contact_id => @contact.id, :id => @phone.id}, {:user_id => @user.id}
		assert_redirected_to contact_path(@contact)
	end


	#
	# new
	#

	test "on GET to :new without user_id in the session should redirect to sign_in" do
		get :new, {:contact_id => @contact.id}
		assert_redirected_to sign_in_path
	end


	test "on GET to :new should show new" do
		get :new, {:contact_id => @contact.id}, {:user_id => @user.id}
		assert_response :success
		assert_template :new
		assert_not_nil assigns(:phone)
	end


	#
	# edit
	#

	test "on GET to :edit without user_id in the session should redirect to sign_in" do
		get :edit, {:contact_id => @contact.id, :id => @phone.id}
		assert_redirected_to sign_in_path
	end


	test "on GET to :edit should show edit" do
		get :edit, {:contact_id => @contact.id, :id => @phone.id}, {:user_id => @user.id}
		assert_response :success
		assert_template :edit
		assert_not_nil assigns(:phone)
	end


	# 
	# create
	#

	test "on POST to :create without user_id in the session should redirect to sign_in" do
		post :create, {:contact_id => @contact.id, :phone => Factory.phone_attributes}
		assert_redirected_to sign_in_path
	end


	test "on POST to :create should create phone" do
		assert_difference("Contact.find(\"#{@contact.id}\").phones.count", 1) do
			post :create, {:contact_id => @contact.id, :phone => Factory.phone_attributes}, {:user_id => @user.id}
		end

		assert_equal "Phone added.", flash[:notice]
	end


	#
	# update
	#

	test "on PUT to :update without user_id in the session should redirect to sign_in" do
		put :update, {:contact_id => @contact.id, :id => @phone.id}, nil, :phone => { }
		assert_redirected_to sign_in_path
	end


	test "on PUT to :update should update phone" do
		put :update, {:contact_id => @contact.id, :id => @phone.id}, {:user_id => @user.id}, :phone => { }
		assert_redirected_to contact_path(@contact)
		assert_equal "Phone updated.", flash[:notice]
	end


	#
	# destroy
	#

	test "on DELETE to :destroy without user_id in the session should redirect to sign_in" do
		delete :destroy, {:contact_id => @contact.id, :id => @phone.id}
		assert_redirected_to sign_in_path
	end


	test "on DELETE to :destroy should delete phone" do
		assert_difference("Contact.find(\"#{@contact.id}\").phones.count", -1) do
			delete :destroy, {:contact_id => @contact.id, :id => @phone.id}, {:user_id => @user.id}
		end

		assert_redirected_to contact_path(@contact)
		assert_equal "Phone deleted.", flash[:notice]
	end

end
