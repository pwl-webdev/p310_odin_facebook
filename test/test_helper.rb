ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

	#def log_in_as(user, options = {})
	#	password    = options[:password]    || 'password'
	#    #if integration_test?
	#      get user_session_path, session: { email:       user.email,
	#                                		 password:    password}
	#    #else
	#    #  session[:user_id] = user.id
	#    #end
	#end

def login_user
  Warden.test_mode!
  user = create(:user)
  login_as user, :scope => :user
  user.confirmed_at = Time.now
  user.confirm!
  user.save
  user
end
end
