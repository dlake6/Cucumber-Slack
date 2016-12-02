class LoginPage < Generic

  def visit_domain_page
    @browser.goto "https://slack.com/signin"
    confirm_domain_page
  end

  def confirm_domain_page
    if @browser.text_field(id: "domain").exists? == false 
        raise "element not found"
    end
  end

  def domain_with(validity)
    if validity == :valid
        @browser.text_field(id: "domain").send_keys "spartaglobal\n"
    elsif validity == :invalid
        @browser.text_field(id: "domain").send_keys "attempt\n"
    else
        raise "wrong argument given"
    end
  end

  def visit
    @browser.goto "https://spartaglobal.slack.com/"
    confirm_page
  end

  def confirm_page
    unless @browser.text_field(id: "email").exists? == true 
      raise "element not found"
    end
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
      if @browser.h2(id: "channels_header").exist? == false
        raise "element not found"
      end
    end

    def confirm_error
      if @browser.p(class: "alert").exists? == false
          raise "No error message appeared"
      end
    end

end
