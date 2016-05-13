# -*- encoding : utf-8 -*-
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
	# Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
	fixtures :all

	# Add more helper methods to be used by all tests here...
	def save_assert_model record, field, message
		record.save
		assert record.errors[field].any?, message
	end
end
