Given(/^I am signed in to my teams page$/) do
  if @user.logged_in? == false
    @login.visit
    @login.login_with :valid  
  end 
end

Then(/^my status should show that Im available$/) do
  @user.check_active 
end

When(/^I decide to mute all messages$/) do
	@user.mute
end

Then(/^it should be visably clear that I have$/) do
  @user.check_mute
end

When(/^I want other team members to be aware that Im away$/) do
  @user.away
end

Then(/^my status should tell them this$/) do
  @user.check_away 
end
