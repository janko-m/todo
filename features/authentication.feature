@javascript
Feature: Authentication

  Scenario: Registration
    When I visit the home page
      And I click on "register"
      And I fill in the registration credentials
      And I click on "Register"
    Then I should be successfully registered
    Then I should be logged in

  Scenario: Login
    Given I'm registered
    When I visit the home page
      And I fill in my login credentials
      And I click on "Login"
    Then I should be successfully logged in
