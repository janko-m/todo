ENV["RAILS_ENV"] = "test"

require_relative "../config/environment"
require "rspec/rails"
require "factory_girl"
require "pry"

FactoryGirl.find_definitions

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.expect_with(:rspec) { |c| c.syntax = :expect }
end
