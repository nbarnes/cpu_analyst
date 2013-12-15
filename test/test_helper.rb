require "simplecov"
SimpleCov.start 'rails'

ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require 'coveralls'

# require "capybara/webkit"
# Capybara.javascript_driver = :webkit

# Uncomment for awesome colorful output
require "minitest/pride"

Coveralls.wear!('rails')

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers
#  include Capybara::RSpecMatchers
  include Capybara::DSL
end
