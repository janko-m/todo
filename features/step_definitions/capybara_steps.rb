When(/^I visit(?: the)? (.+)$/) do |page|
  visit page_url(page)
end

When(/^I click on "(.+)"$/) do |text|
  click_on text
end
