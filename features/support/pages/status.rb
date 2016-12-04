class UserStatus < Generic

  def active
    @browser.i(id: "presence").wait_until_present(10)
    @browser.i(id: "presence").click
    @browser.div(class: "menu_body").wait_until_present(10)
    @browser.li(id: "member_presence").click
    check_active
  end

  def check_active
    @browser.i(id: "presence").wait_until_present(10)
    @browser.i(class: "active").wait_until_present(10)
  end

  def mute
    @browser.button(class: "notifications_menu_btn").wait_until_present(10)
    @browser.button(class: "notifications_menu_btn").click
    @browser.div(id: "menu_items_scroller").wait_until_present(10)
    @browser.ul(id: "menu_items").lis[0].click
  end

  def check_mute
    @browser.i(class: "active dnd").wait_until_present(10)
    unmute
  end

  def unmute
    @browser.button(class: "notifications_menu_btn").click
    @browser.div(class: "menu_content").wait_until_present
    @browser.ul(id: "menu_items").lis[0].a.click
    menu_wait
    check_unmute
  end

  def check_unmute
    Watir::Wait.until { @browser.i(class: "active dnd").exists? == false }
  end

  def away
    @browser.i(id: "presence").wait_until_present(10)
    @browser.i(id: "presence").click
    @browser.div(class: "menu_body").wait_until_present(10)
    @browser.li(id: "member_presence").click
  end

  def check_away
    menu_wait
    @browser.i(class: "away").wait_until_present(10)
    active
  end

  def menu_wait
    Watir::Wait.until { @browser.div(class: "menu_body").exists? == false }
    Watir::Wait.until { @browser.div(class: "menu_items_scroller").exists? == false }
  end

end

