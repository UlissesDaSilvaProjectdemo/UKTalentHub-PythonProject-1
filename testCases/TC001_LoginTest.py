import pytest
from pageObjects.TC001_LoginPage import LoginPage
from utilities.customLogger import LogGen
from utilities.readProperties import ReadConfig



class Test_001_Login:
    baseURL = ReadConfig.getApplicationURL()
    username = ReadConfig.getUseremail()
    password = ReadConfig.getPassword()
    logger = LogGen.loggen()

    @pytest.mark.sanity
    @pytest.mark.regression
    def test_login(self,setup):

        self.logger.info("****Started Login Test****")
        self.driver = setup
        self.driver.get(self.baseURL)
        self.lp = LoginPage(self.driver)
        self.lp.signin_button() 
        self.lp.setPassword(self.password)
        self.lp.setUserName(self.username)
        self.lp.login_btn()


        act_title = self.driver.title
        if act_title == "Login - My Store": #Login - My Store
            self.logger.info("****Login test passed ****")
            self.driver.close()
            assert True
        else:
            self.logger.error("****Login test failed ****")
            self.driver.save_screenshot(".\\Screenshots\\" + "test_homePageTitle.png")
            self.driver.close()
            assert False


