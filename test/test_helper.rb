ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  # Logs in a test user.
	def log_in_as(user, options = {})
		password    = options[:password]    || 'password'
	    #if integration_test?
	      get user_session_path, session: { email:       user.email,
	                                		 password:    password}
	    #else
	    #  session[:user_id] = user.id
	    #end
	end

    # Returns true inside an integration test.
    #def integration_test?
    #  defined?(post_via_redirect)
    #end
end
