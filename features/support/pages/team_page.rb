 class TeamPage < Generic

  def logout
    @browser.i(id: "presence").wait_until_present
    @browser.i(id: "presence").click
    @browser.div(class: "menu_body").wait_until_present
    @browser.li(id: "logout").click
    confirm_logout
  end

  def confirm_logout
    sleep 2
    unless @browser.h1.text == "You've signed out of Slack"
      raise "logout was not achieved"
    end
  end

  def logged_in? 
    if @browser.url.include? "spartaglobal.slack.com/messages"
      return true
    else
      return false
    end
  end

end