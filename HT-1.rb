#registraciya
require 'selenium-webdriver'

def reg_user_as(log)
  @a.find_element(:name, 'user[login]').send_keys log
  @a.find_element(:name, 'user[password]').send_keys '123456'
  @a.find_element(:name, 'user[password_confirmation]').send_keys '123456'
  @a.find_element(:name, 'user[firstname]').send_keys 'serg'
  @a.find_element(:name, 'user[lastname]').send_keys 'serg'
  @a.find_element(:name, 'user[mail]').send_keys(log + '@mailinator.com')
  @a.find_element(:name, 'user[language]').send_key
  @a.find_element(:name, 'commit').click
end

@a = Selenium::WebDriver.for :firefox
@a.get 'http://demo.redmine.org'
@a.find_element(:class, 'register').click

@random = 6.times.map{Random.rand(9)}.join

reg_user_as(@random)

@a.find_element(:name, 'commit').click

sleep 5

#fail 'Password change failed' if @a.find_element(:id, 'flash_notice').text != 'Account was successfully updated.'
@a.find_element(:class, 'home').click
#@a.close