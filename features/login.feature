@sign_in @smoke
Feature: Sign_in

  @domain @dom_invalid
  Scenario: The one where I enter invalid team name
    Given I am on the team name page 
    When I enter a team name that doesn't exist
    Then I should remain on the page 
    And an error message should appear
    
  @domain @dom_valid
  Scenario: The one where I enter valid Team name
    Given I am on the sign in page 
    When I enter a valid team name
    Then I should be directed to the next page

  @user @user_invalid
  Scenario: The one where I enter invalid email and password
    Given I am on the page where I can log in as a team member
    When I attempt to log in with invalid credentials
    Then I should still be on the same page 
    And an error will be visable telling me why I have not been logged in

  @user @user_valid
  Scenario: The one where I enter valid email and password
    Given I am on the sign in with email and password page
    When I sign in as an existing member of the team
    Then I should be taken to my teams page



