class Status < Generic

  def active
    @browser.i(id: "presence").click
    @browser.div(class: "menu_body").wait_until_present
    @browser.li(id: "member_presence").click
    check_active
  end

  def check_active
    @browser.i(id: "presence").wait_until_present
    @browser.i(class: "active").wait_until_present
  end

  def mute
    @browser.button(class: "notifications_menu_btn").wait_until_present
    @browser.button(class: "notifications_menu_btn").click
    @browser.div(id: "menu_items_scroller").wait_until_present
    @browser.ul(id: "menu_items").lis[0].click
  end

  def check_mute
    @browser.i(class: "active dnd").wait_until_present
    unmute
  end

  def unmute
    @browser.button(class: "notifications_menu_btn").click
    @browser.div(class: "menu_content").wait_until_present
    @browser.ul(id: "menu_items").lis[0].a.click
    check_unmute
  end

  def check_unmute
    menu_wait
    if @browser.i(class: "active dnd").exist? == true
      raise "notifications are still muted"
    end
  end

  def away
    @browser.i(id: "presence").wait_until_present
    @browser.i(id: "presence").click
    @browser.div(class: "menu_body").wait_until_present
    @browser.li(id: "member_presence").click
  end

  def check_away
    menu_wait
    @browser.i(class: "away").wait_until_present
    active
  end

  def menu_wait
    Watir::Wait.until { @browser.div(class: "menu_body").exists? == false }
  end

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
