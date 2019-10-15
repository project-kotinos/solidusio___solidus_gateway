require "simplecov"
require 'yourbase/rspec/skipper'
SimpleCov.start "rails"

ENV["RAILS_ENV"] ||= "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)

require 'solidus_support/extension/feature_helper'

require 'selenium-webdriver'
Capybara.javascript_driver = :selenium_chrome_headless

require 'braintree'

Dir[File.join(File.dirname(__FILE__), "support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!

  config.before :suite do
    # Don't log Braintree to STDOUT.
    Braintree::Configuration.logger = Logger.new("spec/dummy/tmp/log")
  end

  FactoryBot.find_definitions
end
