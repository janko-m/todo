Given(/^I created a task$/) do
  @user.tasks.create!(
    content:  "Watch game of thrones",
    due_date: Date.today,
    priority: 3,
  )
  refresh
end

Given(/^I created some tasks$/) do
  @user.tasks.create! [
    {
      content:  "Watch game of thrones",
      due_date: Date.today,
      priority: 3,
    },
    {
      content:  "Study for college",
      due_date: Date.today + 1.day,
      priority: 1,
    },
  ]
  refresh
end

When(/^I fill in the new task$/) do
  fill_in "Content",  with: "Watch game of thrones"
  find_field("Due date").click; find(".datepicker .today").click
  choose "Low"
end

When(/^I mark it as completed$/) do
  within(Task.find_by(content: "Watch game of thrones")) do
    check "task_complete"
  end
end

Then(/^I should see my new task$/) do
  expect(page).to have_content("Watch game of thrones")
end

Then(/^I should not see the task anymore$/) do
  expect(page).not_to have_content("Watch game of thrones")
end

Then(/^the task should still be marked as completed$/) do
  within(Task.find_by(content: "Watch game of thrones")) do
    expect(find_field("task_complete")).to be_checked
  end
end

Then(/^I can sort them by due date$/) do
  click_on "Due date"
  expect(all("tbody tr").first).to have_content("Watch game of thrones")
  expect(all("tbody tr").last).to have_content("Study for college")
  click_on "Due date"
  expect(all("tbody tr").first).to have_content("Study for college")
  expect(all("tbody tr").last).to have_content("Watch game of thrones")
end

Then(/^I can sort them by priority$/) do
  click_on "Priority"
  expect(all("tbody tr").first).to have_content("Study for college")
  expect(all("tbody tr").last).to have_content("Watch game of thrones")
  click_on "Priority"
  expect(all("tbody tr").first).to have_content("Watch game of thrones")
  expect(all("tbody tr").last).to have_content("Study for college")
end
