require 'selenium-webdriver'
require '../Base/base'
require 'test/unit'

class Login

  @chromedriver
  def initialize(driver)
    @chromedriver=driver

  end


  def enterusername (username)
    @chromedriver.find_element(:xpath,"//*[@id='username']").send_keys(username)
  end

  def enterpassword (password)
    @chromedriver.find_element(:xpath,"//*[@id='password']").send_keys(password)
  end

  def loginbtn
    @chromedriver.find_element(:xpath,"//*[@id='login-form']//*[@type='submit']").click
  end

end