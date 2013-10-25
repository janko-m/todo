Given(/^I created a task$/) do
  @user.tasks.create!(
    content:  "Watch game of thrones",
    due_date: "25 December 2013",
    priority: 3,
  )
  refresh
end

Given(/^I created some tasks$/) do
  @user.tasks.create! [
    {
      content:  "Watch game of thrones",
      due_date: "25 December 2013",
      priority: 3,
    },
    {
      content:  "Study for college",
      due_date: "26 December 2013",
      priority: 1,
    },
  ]
  refresh
end

When(/^I fill in a new task$/) do
  fill_in "task_content", with: "Watch game of thrones"
end

When(/^I mark it as completed$/) do
  within(all("td")[0]) { find("[type='checkbox']").set(true) }
end

When(/^I click on the content$/) do
  first("span", text: "Watch game of thrones").click
end

When(/^I type in another content$/) do
  within(all("td")[1]) { find("[type='text']").set("Watch something else") }
end

When(/^I click on the due date$/) do
  first("span", text: "25 December 2013").click
end

When(/^I select another date$/) do
  all(".datepicker td", text: "26").last.click
end

When(/^I click on the priority$/) do
  first("span", text: "High").click
end

Then(/^I should see my new task$/) do
  expect(find("#tasks")).to have_content("Watch game of thrones")
end

Then(/^I should not see the task anymore$/) do
  expect(find("#tasks")).to have_no_content("Watch game of thrones")
end

Then(/^the task should still be marked as completed$/) do
  expect(find("[type='checkbox']")).to be_checked
end

Then(/^I can sort them by due date$/) do
  click_on "Due date"
  expect(tasks[0]).to have_content("Watch game of thrones")
  expect(tasks[1]).to have_content("Study for college")
  click_on "Due date"
  expect(tasks[0]).to have_content("Study for college")
  expect(tasks[1]).to have_content("Watch game of thrones")
end

Then(/^I can sort them by priority$/) do
  click_on "Priority"
  expect(tasks[0]).to have_content("Study for college")
  expect(tasks[1]).to have_content("Watch game of thrones")
  click_on "Priority"
  expect(tasks[0]).to have_content("Watch game of thrones")
  expect(tasks[1]).to have_content("Study for college")
end

Then(/^the content should change$/) do
  expect(find("#tasks")).to have_text("Watch something else")
  expect(find("#tasks")).to have_no_field("task_content")
end

Then(/^the due date should change$/) do
  expect(find("#tasks")).to have_text("26 December 2013")
  expect(find("#tasks")).to have_no_field("task_due_date")
end

Then(/^the priority should change$/) do
  expect(find("#tasks")).to have_text("Low")
  expect(find("#tasks")).to have_no_text("High")
end
