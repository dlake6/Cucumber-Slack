Given(/^I am on the team name page$/) do
  App.login_page.visit_domain_page
end

When(/^I enter a team name that doesn't exist$/) do
  App.login_page.domain_with :invalid
end

Then(/^I should remain on the page$/) do
  App.login_page.confirm_domain_page
end

And(/^an error message should appear$/) do
  App.login_page.confirm_error
end

Given(/^I am on the sign in page$/) do
  App.login_page.visit_domain_page 
end

When(/^I enter a valid team name$/) do
  App.login_page.domain_with :valid
end

Then(/^I should be directed to the next page$/) do
  App.login_page.confirm_page
end	

Given(/^I am on the page where I can log in as a team member$/) do
  App.login_page.visit
end

When(/^I attempt to log in with invalid credentials$/) do
  App.login_page.login_with :invalid
end

Then(/^I should still be on the same page$/) do
  App.login_page.confirm_page
end

And(/^an error will be visable telling me why I have not been logged in$/) do
  App.login_page.confirm_error
end

Given(/^I am on the sign in with email and password page$/) do
  App.login_page.visit
end

When(/^I sign in as an existing member of the team$/) do
  App.login_page.login_with :valid
end

Then(/^I should be taken to my teams page$/) do
  App.login_page.confirm_login
end
