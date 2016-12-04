@logout
Feature: logout

  Scenario: the one where I want to log out
    Given I am logged in
    When I decide to log out
    Then I should be directed to the logout page