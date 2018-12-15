require 'selenium-webdriver'
require 'test/unit'


class Dashboard


  def initialize(driver)
    @chromedriver=driver
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    @TableHeaderLocator = "//*[text()='Tickets created by me']"
    @ticketsBtnLocator = "//*[@id='tickets_link']/a"
  end


  def verifyDashboardPageLoaded
    # wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    @wait.until {
      @chromedriver.find_element(:xpath, @TableHeaderLocator).displayed?
    }
  end

  def clickTicketBtn
    @wait.until {
      @chromedriver.find_element(:xpath, @ticketsBtnLocator).displayed?
    }
    @chromedriver.find_element(:xpath, @ticketsBtnLocator).click
  end


end