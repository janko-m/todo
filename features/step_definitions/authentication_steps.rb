Given(/^I'm registered$/) do
  @user = User.create!(
    username: "janko",
    password: "secret",
    password_confirmation: "secret"
  )
end

Given(/^I'm logged in$/) do
  steps "Given I'm registered"
  visit login_path
  fill_in "Username", with: "janko"
  fill_in "Password", with: "secret"
  click_on "Login"
end

When(/^I fill in the registration credentials$/) do
  fill_in "Username", with: "janko"
  fill_in "Password", with: "secret"
  fill_in "Password confirmation", with: "secret"
end

When(/^I fill in my login credentials$/) do
  fill_in "Username", with: "janko"
  fill_in "Password", with: "secret"
end

Then(/^I should be successfully registered$/) do
  expect(User.count).to eq 1
end

Then(/^I should be(?: successfully)? logged in$/) do
  expect(navbar).to have_text("janko")
end
