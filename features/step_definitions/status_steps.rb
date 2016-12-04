Given(/^I am signed in to my teams page$/) do
  if App.user_status.logged_in? == false
    App.login_page.visit
    App.login_page.login_with :valid
  end 
end

Then(/^my status should show that Im available$/) do
  App.user_status.check_active 
end

When(/^I decide to mute all messages$/) do
  App.user_status.mute
end

Then(/^it should be visably clear that I have$/) do
  App.user_status.check_mute
end

When(/^I want other team members to be aware that Im away$/) do
  App.user_status.away
end

Then(/^my status should tell them this$/) do
  App.user_status.check_away 
end
