browser = Watir::Browser.new :chrome

Before do
	@login = LoginPage.new(browser)
	@user = Status.new(browser)
  #@app = App.new(browser)
end

After do

end

at_exit do 
	@user.logout
	@user.confirm_logout
end

