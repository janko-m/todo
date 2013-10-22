require "factory_girl"

FactoryGirl.define do
  factory :user do
    username "janko"
    password "secret"
    password_confirmation "secret"
  end

  factory :task do
    content "Watch game of thrones"
    due_date Date.today
    priority 3
  end
end
