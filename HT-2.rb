#login
require 'selenium-webdriver'

def auto_user_as(log)
  @a.find_element(:id, 'username').send_keys log
  @a.find_element(:id, 'password').send_keys '123456'
  @a.find_element(:name, 'login').click
end

@a = Selenium::WebDriver.for :firefox
@a.get 'http://demo.redmine.org'
@a.find_element(:class, 'login').click
sleep 5

auto_user_as(343521)
