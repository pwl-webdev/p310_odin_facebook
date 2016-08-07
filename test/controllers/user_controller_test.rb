class UserControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

	RSpec.configure do |config|
	  config.include Devise::Test::ControllerHelpers, :type => :controller
	end

	def setup
		@user = users(:michael)
		@other_user = users(:archer)
	end

	#test "should get new user session" do
    #	get :new_user_session
    #	assert_response :success
  	#end

end
