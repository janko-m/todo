@javascript
Feature: Tasks

  Background:
    Given I'm logged in

  Scenario: Adding tasks
    When I fill in a new task
    And I click on "Create task"
    Then I should see my new task

  Scenario: Removing tasks
    Given I created a task
    When I click on "×"
    Then I should not see the task anymore

  Scenario: Completing tasks
    Given I created a task
    When I mark it as completed
      And I refresh the page
    Then the task should still be marked as completed

  Scenario: Sorting
    Given I created some tasks
    Then I can sort them by due date
    And I can sort them by priority

  Scenario: Editing
    Given I created a task

    When I click on the content
    And I type in another content
    Then the content should change

    When I click on the due date
    And I select another date
    Then the due date should change

    When I click on the priority
    Then the priority should change
