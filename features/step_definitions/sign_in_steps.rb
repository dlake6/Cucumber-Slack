Given(/^I am on the sign in page$/) do
  @login.visit_domain_page 
end

When(/^I enter a valid team name$/) do
  @login.domain_with(:valid)
end

Then(/^I should be directed to the next page$/) do
  @login.confirm_domain_page 
end	

Given(/^I am on the team name page$/) do
  @login.visit_domain_page
end

When(/^I enter a team name that doesn't exist$/) do
  @login.domain_with(:invalid)
end

Then(/^I should remain on the page$/) do
  @login.confirm_domain_page
end

And(/^an error message should appear$/) do
  @login.confirm_error
end

Given(/^I am on the sign in with email and password page$/) do
  @login.visit
end

When(/^I sign in as an existing member of the team$/) do
  @login.login_with(:valid)
end

Then(/^I should be taken to my teams page$/) do
  @login.confirm_login
  @user.logout
  @user.confirm_logout
end

Given(/^I am on the page where I can log in as a team member$/) do
  @login.visit
end

When(/^I attempt to log in with invalid credentials$/) do
  @login.login_with(:invalid)
end

Then(/^I should still be on the same page$/) do
  @login.confirm_page
end

And(/^an error will be visable telling me why I have not been logged in$/) do
  @login.confirm_error
end
