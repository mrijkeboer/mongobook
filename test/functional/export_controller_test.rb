require File.expand_path("../../test_helper", __FILE__)
require File.expand_path("../../factory", __FILE__)

class ExportControllerTest < ActionController::TestCase

	def setup
		@user = Factory.user!
		@contact = Factory.contact!
	end


	#
	# all
	#

	test "on GET to :all without user_id in the session should redirect to sign_in" do
		get :all
		assert_redirected_to sign_in_path
	end


	test "on GET to :all should show data" do
		get :all, nil, {:user_id => @user.id}
		assert_response :success
		assert_template :all
		assert_not_nil assigns(:contacts)
		assert_equal 1, assigns(:contacts).length
	end

end
