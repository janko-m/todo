require "cucumber/rails"
require "pry"
require "capybara"
require "capybara/poltergeist"

DatabaseCleaner.clean_with :truncation
