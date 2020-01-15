from selenium import webdriver
from selenium.common.exceptions import NoSuchElementException
import unittest, time, re

class TestChiaravalliWebDriwer(unittest.TestCase):
    def setUp(self):
        self.driver = webdriver.Chrome('C:/Users/Bartłomiej/Desktop/chromedriver.exe')
        self.driver.implicitly_wait(30)
        self.base_url = "http://www.google.com/"
        self.verificationErrors = []
        self.accept_next_alert = True
        
    def test_chiaravalli_web_driwer(self):
        user_name = ""
        password = ""
        driver = self.driver
        driver.set_window_size('360', '600')
        driver.get(f'https://{user_name}:{password}@___/')
        time.sleep(5)

        try:
            self.assertEqual("NASZA OFERTA", driver.find_element_by_xpath(
                u"(.//*[normalize-space(text()) and normalize-space(.)='Dowiedz się więcej'])[5]/following::h2[1]").text)
        except AssertionError as e:
            self.verificationErrors.append(str(e))

        try:
            self.assertEqual(
                u"Oferujemy bogaty zakres akcesoriów mechaniki maszyn, między innymi koła łańcuchowe, koła pasowe, koła zębate, przekładnie, sprzęgła.",
                driver.find_element_by_xpath(
                    u"(.//*[normalize-space(text()) and normalize-space(.)='NASZA OFERTA'])[1]/following::p[1]").text)
        except AssertionError as e:
            self.verificationErrors.append(str(e))

        try:
            self.assertEqual(u"___ POLSKA SP. Z O.O.", driver.find_element_by_xpath(
            u"(.//*[normalize-space(text()) and normalize-space(.)='Zobacz produkty'])[3]/following::h2[1]").text)
        except AssertionError as e:
            self.verificationErrors.append((str(e)))

        try:
            self.assertEqual(u"Strona główna", driver.title)
        except AssertionError as e:
            self.verificationErrors.append(str(e))

        try:
            self.assertEqual("___ W LICZBACH", driver.find_element_by_xpath(
                u"(.//*[normalize-space(text()) and normalize-space(.)='Dowiedz się więcej'])[7]/following::h2[1]").text)
        except AssertionError as e:
            self.verificationErrors.append(str(e))

        try:
            self.assertEqual(u"CENTRUM OBRÓBKI MECHANICZNEJ", driver.find_element_by_xpath(
                u"//h2[contains(text(),'CENTRUM OBRÓBKI MECHANICZNEJ')]").text)
        except AssertionError as e:
            self.verificationErrors.append(str(e))
        time.sleep(15)
    def is_element_present(self, how, what):
        try:
            self.driver.find_element(by=how, value=what)
        except NoSuchElementException as e:
            return False
        return True

if __name__ == "__main__":
    unittest.main()
