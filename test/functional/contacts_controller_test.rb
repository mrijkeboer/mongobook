require File.expand_path("../../test_helper", __FILE__)
require File.expand_path("../../factory", __FILE__)

class ContactsControllerTest < ActionController::TestCase

	def setup
		@user = Factory.user!
		@contact = Factory.contact!
	end


	#
	# index
	#

	test "on GET to :index without user_id in the session should redirect to sign_in" do
		get :index
		assert_redirected_to sign_in_path
	end


	test "on GET to :index should show contacts" do
		get :index, nil, {:user_id => @user.id}
		assert_response :success
		assert_template :index
		assert_not_nil assigns(:contacts)
		assert_equal 1, assigns(:contacts).length
	end


	#
	# search
	#

	test "on POST to :search without user_id in the session should redirect to sign_in" do
		post :search
		assert_redirected_to sign_in_path
	end


	test "on POST to :search should show search" do
		post :search, nil, {:user_id => @user.id}
		assert_response :success
		assert_template :search
		assert_not_nil assigns(:contacts)
	end


	#
	# show
	#
	
	test "on GET to :show without user_id in the session should redirect to sign_in" do
		get :show, {:id => @contact.id}
		assert_redirected_to sign_in_path
	end
		

	test "on GET to :show should show contact" do
		get :show, {:id => @contact.id}, {:user_id => @user.id}
		assert_response :success
		assert_template :show
		assert_not_nil assigns(:contact)
	end


	#
	# new
	#

	test "on GET to :new without user_id in the session should redirect to sign_in" do
		get :new
		assert_redirected_to sign_in_path
	end


	test "on GET to :new should show new" do
		get :new, nil, {:user_id => @user.id}
		assert_response :success
		assert_template :new
		assert_not_nil assigns(:contact)
	end


	#
	# edit
	#

	test "on GET to :edit without user_id in the session should redirect to sign_in" do
		get :edit, {:id => @contact.id}
		assert_redirected_to sign_in_path
	end


	test "on GET to :edit should show edit" do
		get :edit, {:id => @contact.id}, {:user_id => @user.id}
		assert_response :success
		assert_template :edit
		assert_not_nil assigns(:contact)
	end


	# 
	# create
	#

	test "on POST to :create without user_id in the session should redirect to sign_in" do
		post :create, {:contact => Factory.contact_attributes}
		assert_redirected_to sign_in_path
	end


	test "on POST to :create should create contact" do
		assert_difference('Contact.count', 1) do
			post :create, {:contact => Factory.contact_attributes}, {:user_id => @user.id}
		end

		assert_equal "Contact created.", flash[:notice]
	end


	#
	# update
	#

	test "on PUT to :update without user_id in the session should redirect to sign_in" do
		put :update, {:id => @contact.id}, nil, :contact => { }
		assert_redirected_to sign_in_path
	end


	test "on PUT to :update should update contact" do
		put :update, {:id => @contact.id}, {:user_id => @user.id}, :contact => { }
		assert_redirected_to contact_path(@contact)
		assert_equal "Contact updated.", flash[:notice]
	end


	#
	# destroy
	#

	test "on DELETE to :destroy without user_id in the session should redirect to sign_in" do
		delete :destroy, {:id => @contact.id}, nil
		assert_redirected_to sign_in_path
	end


	test "on DELETE to :destroy should delete contact" do
		assert_difference('Contact.count', -1) do
			delete :destroy, {:id => @contact.id}, {:user_id => @user.id}
		end

		assert_redirected_to contacts_path
		assert_equal "Contact deleted.", flash[:notice]
	end

end
