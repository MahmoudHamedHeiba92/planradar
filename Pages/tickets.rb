require 'selenium-webdriver'
require 'test/unit'
require 'test/unit/testcase'
require 'test/unit/assertions'
require '../Base/base'



class Tickets

  def initialize(driver)
    @chromedriver=driver
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)


    @Ticketscountlocator                     = "//*[contains(text(),'found')]"
    @AddNewTicketBtnLocator                  = "//*[contains(text(),'Add new ticket')]"
    @NewTicketModalLocator                   = "//*[@class='modal-content']"
    @componentDropDownDisplayBtn             = "//*[@class='modal-content']//label[@for='component']/parent::*[@class='form-group']//*[@class='Select-arrow']"
    @componentDropDownGroundFloor            = "//*[@class='Select-menu-outer']//*[text()='Ground floor']"
    @ParentTicketDropdownDisplayBtn          = "//*[@class='modal-content']//label[text()='Parent ticket']/parent::*[@class='form-group']//*[@class='Select-arrow']"
    @ParentTicketDropdownCrackinplaster      = "//*[@class='Select-menu-outer']//*[text()='Cracks in plaster']"
    @TitleTextbox                            = "//*[@class='modal-content']//label[text()='Title']/parent::*//*[@id='status']"
    @SaveandCloseBtn                         = "//*[@class='modal-content']//button[text()='Save and close']"
    @NewticketTitleAtTicketsTable            = "//*[@role='rowgroup']//*[@role='row'][1]//*[@role='gridcell'][3]"

    @ticketsdisplayed                        = "//*[@role='rowgroup']//*[@role='row']"
  end


  def clickAddNewTicketBtn

    @wait.until {@chromedriver.find_element(:xpath, @Ticketscountlocator).displayed?}
    @wait.until {@chromedriver.find_element(:xpath, @AddNewTicketBtnLocator).displayed?}

    @ticketscountbefore = @chromedriver.find_elements(:xpath, @ticketsdisplayed).count
    puts  @ticketscountbefore

    @chromedriver.find_element(:xpath, @AddNewTicketBtnLocator).click
  end

  def verifyNewTicketModaldisplayed
    @wait.until {@chromedriver.find_element(:xpath, @NewTicketModalLocator).displayed?}
    sleep  2
  end

  def chooseComponentGroundFloor
    @wait.until {@chromedriver.find_element(:xpath, @componentDropDownDisplayBtn).displayed?}
    @chromedriver.find_element(:xpath, @componentDropDownDisplayBtn).click

    @wait.until {@chromedriver.find_element(:xpath, @componentDropDownGroundFloor).displayed?}
    @chromedriver.find_element(:xpath, @componentDropDownGroundFloor).click
  end

  def chooseParentTicketCrackInPlaster
      @wait.until {@chromedriver.find_element(:xpath, @ParentTicketDropdownDisplayBtn).displayed?}
      @chromedriver.find_element(:xpath, @ParentTicketDropdownDisplayBtn).click

      @wait.until {@chromedriver.find_element(:xpath, @ParentTicketDropdownCrackinplaster).displayed?}
      @chromedriver.find_element(:xpath, @ParentTicketDropdownCrackinplaster).click

  end
  def enterTitle (ticketTitle)
    @chromedriver.find_element(:xpath, @TitleTextbox).send_keys(ticketTitle)
  end

  def clickSaveandcloseBtn
    @chromedriver.find_element(:xpath, @SaveandCloseBtn).click
  end

  def verifyNewTicketcreatedwithName (expectedticketname)
    @wait.until {@chromedriver.find_element(:xpath, @NewticketTitleAtTicketsTable).displayed?}
    sleep  2
    ticketname = @chromedriver.find_element(:xpath, @NewticketTitleAtTicketsTable).text()

    ticketscountafter = @chromedriver.find_elements(:xpath, @ticketsdisplayed).count

    if @ticketscountbefore+1 == ticketscountafter
      puts  "test passed"
    else
      raise Exception
    end

  end

end