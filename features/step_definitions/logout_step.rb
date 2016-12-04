Given(/^I am logged in$/) do
  if App.team_page.logged_in? == false
    App.login_page.visit
    App.login_page.login_with :valid
  end
end

When(/^I decide to log out$/) do
	App.team_page.logout 
end

Then(/^I should be directed to the logout page$/) do
  App.team_page.confirm_logout
end