class LoginPage < Generic

  def visit_domain_page
    @browser.goto "https://slack.com/signin"
    confirm_domain_page
  end

  def confirm_domain_page
   raise if @browser.text_field(id: "domain").exists? == false
  end

  def domain_with(validity)
    if validity == :valid
      @browser.text_field(id: "domain").send_keys "spartaglobal\n"
    elsif validity == :invalid
      @browser.text_field(id: "domain").send_keys "Fanart\n"
    else
      raise "wrong argument given"
    end
  end

  def visit
    @browser.goto "https://spartaglobal.slack.com/"
    confirm_page
  end

  def confirm_page
    raise if @browser.text_field(id: "email").exists? == false 
  end

    def login_with(validity)
      if validity == :valid
        @browser.text_field(id: "email").send_keys "dlake@spartaglobal.co"
        @browser.text_field(id: "password").send_keys "\n"
      elsif validity == :invalid
        @browser.text_field(id: "email").send_keys "dlake@spartaglobal.co"
        @browser.text_field(id: "password").send_keys "\n"
      else
        raise "wrong argument given"
      end
    end

    def confirm_login
      raise if @browser.h2(id: "channels_header").exist? == false
    end

    def confirm_error
      raise if @browser.p(class: "alert").exists? == false
    end

end
