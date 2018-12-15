require 'selenium-webdriver'
require 'test/unit'
require '../Base/base'
require '../Pages/login'
require '../Pages/homepage'
require '../Pages/dashboard'
require '../Pages/tickets'

class TC_planradar_creatnewlayout < TestAutomationTask

  def test_testcase_001
    homepage = Homepage.new @@driver
    login = Login.new @@driver
    dashboard = Dashboard.new  @@driver
    tickets = Tickets.new  @@driver

    homepage.navigateHomePage  "https://www.planradar.com"
    homepage.clickonloginbtn
    login.enterusername            "mahmoudheiba.assessment.task@gmail.com"
    login.enterpassword            "123/123/123"
    login.loginbtn
    dashboard.verifyDashboardPageLoaded
    dashboard.clickTicketBtn
    tickets.clickAddNewTicketBtn
    tickets.verifyNewTicketModaldisplayed
    tickets.chooseComponentGroundFloor
    tickets.chooseParentTicketCrackInPlaster
    tickets.enterTitle              "New Layout"
    tickets.clickSaveandcloseBtn
    tickets.verifyNewTicketcreatedwithName  "New Layout"
  end

end