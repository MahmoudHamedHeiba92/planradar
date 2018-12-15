require 'test/unit'
require 'selenium-webdriver'
require '../Base/base'

class Homepage
  @chromedriver
  def initialize(driver)
    @chromedriver=driver

  end

  def navigateHomePage (url)
    @chromedriver.get(url)
  end

  def clickonloginbtn
    @chromedriver.find_element(:xpath,"//*[@id='nav-menu-item-1422']").click
  end

end