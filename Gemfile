ruby "2.0.0"

source "https://rubygems.org"

gem "rails", ">= 4.0.1.rc1"
gem "pg"

group :assets do
  gem "sass-rails", "~> 4.0.0"
  gem "uglifier", ">= 1.3.0"
  gem "coffee-rails", "~> 4.0.0"
  gem "jquery-rails"
  gem "bootstrap-sass-rails", "< 3"
  gem "turbolinks", ">= 1.3"
  gem "jquery-turbolinks", "~> 1.0"
  gem "bootstrap-datepicker-rails"
  gem "eco", ">= 1"
end

gem "bcrypt-ruby", "~> 3.1.2"
gem "squeel", ">= 1.1.1"
gem "inherited_resources", ">= 1.4.1"
gem "active_attr", ">= 0.8.2"
gem "ransack", ">= 1"

gem "haml", ">= 4"
gem "haml-rails"
gem "simple_form", ">= 3.0.0"
gem "draper", ">= 1.2.1"
gem "redcarpet", ">= 3"
gem "pygments.rb", ">= 0.5.2"

group :development, :test do
  gem "jasminerice", github: "bradphelan/jasminerice"
end

group :development do
  gem "thin"
  gem "pry-rails", ">= 0.3.2"
  gem "better_errors", ">= 1.0.1"
  gem "binding_of_caller", ">= 0.7.2"
  gem "quiet_assets"
end

group :test do
  gem "pry"
  gem "rspec-rails", ">= 2.14"
  gem "factory_girl", ">= 4.2"
  gem "capybara", ">= 2"
  gem "cucumber-rails", ">= 1.4"
  gem "database_cleaner", ">= 1.2"
  gem "poltergeist", ">= 1.4.1"
end

group :production do
  gem "unicorn"
  gem "rails_12factor" # For heroku
end
