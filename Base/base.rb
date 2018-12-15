require 'selenium-webdriver'
require 'test/unit'

class TestAutomationTask < Test::Unit::TestCase

  def setup
    Selenium::WebDriver::Chrome.driver_path="../Drivers/chromedriver.exe"
    @@driver=Selenium::WebDriver.for :chrome
    #maximize the browser window
    @@driver.manage.window.maximize

  end

  def assertvaluesareequal (expected, actual)
    assertEqual(expected, actual)
  end

  def teardown
    @@driver.quit
  end
end