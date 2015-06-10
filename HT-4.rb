#smena parolya
require 'selenium-webdriver'

def auto_user_as(log)
  @a.find_element(:id, 'username').send_keys log
  @a.find_element(:id, 'password').send_keys '123456'
  @a.find_element(:name, 'login').click
  @a.find_element(:class, 'my-account').click
  @a.find_element(:class, 'icon-passwd').click
  @a.find_element(:name, 'commit').click
end

@a = Selenium::WebDriver.for :firefox
@a.get 'http://demo.redmine.org'
@a.find_element(:class, 'login').click

sleep 10

auto_user_as(447358)

@a.find_element(:class, 'my-account').click
sleep 5
@a.find_element(:class, 'icon-passwd').click
sleep 10

@a.find_element(:id, 'password').send_keys '123456'
@a.find_element(:id, 'new_password').send_keys '222222'
@a.find_element(:id, 'new_password_confirmation').send_keys '222222'
sleep 5
@a.find_element(:name, 'commit').click

fail 'lol :(' unless @a.find_element(:id, 'flash_notice').text == 'Password was successfully updated.'