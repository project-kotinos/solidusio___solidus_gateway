# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'solidus_gateway/version'

# encoding: UTF-8

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = "solidus_gateway"
  s.version     = SolidusGateway::VERSION
  s.summary     = "Additional Payment Gateways for Solidus"
  s.description = s.summary
  s.required_ruby_version = ">= 2.1"

  s.author       = "Solidus Team"
  s.email        = "contact@solidus.io"
  s.homepage     = "https://solidus.io"
  s.license      = %q{BSD-3}

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- spec/*`.split("\n")
  s.require_path = "lib"
  s.requirements << "none"

  s.add_dependency "solidus_core", [">= 1.1", "< 3"]
  s.add_dependency "solidus_support", ">= 0.1.3"

  # ActiveMerchant v1.58 through v1.59 introduced a breaking change
  # to the stripe gateway.
  #
  # This was resolved in v1.60, but we still need to skip 1.58 & 1.59.
  s.add_dependency "activemerchant", "~> 1.48", "!= 1.58.0", "!= 1.59.0"

  s.add_development_dependency "braintree", "~> 2.0"
  s.add_development_dependency "rspec-rails", "~> 3.2"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "sprockets", "< 4.0.0"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "capybara", "~> 2.18"
  s.add_development_dependency "capybara-screenshot"
  s.add_development_dependency "poltergeist", "~> 1.9"
  s.add_development_dependency "selenium-webdriver"
  s.add_development_dependency "database_cleaner", "~> 1.5"
end
