require File.expand_path("../../test_helper", __FILE__)
require File.expand_path("../../factory", __FILE__)

class WebsitesControllerTest < ActionController::TestCase

	def setup
		@user = Factory.user!
		@website = Factory.website!
		@contact = @website.contact
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
		get :show, {:contact_id => @contact.id, :id => @website.id}
		assert_redirected_to sign_in_path
	end
		

	test "on GET to :show should redirect to contacts" do
		get :show, {:contact_id => @contact.id, :id => @website.id}, {:user_id => @user.id}
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
		assert_not_nil assigns(:website)
	end


	#
	# edit
	#

	test "on GET to :edit without user_id in the session should redirect to sign_in" do
		get :edit, {:contact_id => @contact.id, :id => @website.id}
		assert_redirected_to sign_in_path
	end


	test "on GET to :edit should show edit" do
		get :edit, {:contact_id => @contact.id, :id => @website.id}, {:user_id => @user.id}
		assert_response :success
		assert_template :edit
		assert_not_nil assigns(:website)
	end


	# 
	# create
	#

	test "on POST to :create without user_id in the session should redirect to sign_in" do
		post :create, {:contact_id => @contact.id, :website => Factory.website_attributes}
		assert_redirected_to sign_in_path
	end


	test "on POST to :create should create website" do
		assert_difference("Contact.find(\"#{@contact.id}\").websites.count", 1) do
			post :create, {:contact_id => @contact.id, :website => Factory.website_attributes}, {:user_id => @user.id}
		end

		assert_equal "Website added.", flash[:notice]
	end


	#
	# update
	#

	test "on PUT to :update without user_id in the session should redirect to sign_in" do
		put :update, {:contact_id => @contact.id, :id => @website.id}, nil, :website => { }
		assert_redirected_to sign_in_path
	end


	test "on PUT to :update should update website" do
		put :update, {:contact_id => @contact.id, :id => @website.id}, {:user_id => @user.id}, :website => { }
		assert_redirected_to contact_path(@contact)
		assert_equal "Website updated.", flash[:notice]
	end


	#
	# destroy
	#

	test "on DELETE to :destroy without user_id in the session should redirect to sign_in" do
		delete :destroy, {:contact_id => @contact.id, :id => @website.id}
		assert_redirected_to sign_in_path
	end


	test "on DELETE to :destroy should delete website" do
		assert_difference("Contact.find(\"#{@contact.id}\").websites.count", -1) do
			delete :destroy, {:contact_id => @contact.id, :id => @website.id}, {:user_id => @user.id}
		end

		assert_redirected_to contact_path(@contact)
		assert_equal "Website deleted.", flash[:notice]
	end

end
