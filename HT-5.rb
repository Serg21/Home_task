#open proj
require 'selenium-webdriver'

@a = Selenium::WebDriver.for :firefox

#def message_is( message)
 # @browser.find_element(id: 'flash_notice').text.include? message
#end

def open_home_page
  @a.get 'http://demo.redmine.org'
end

def open_login
  @a.find_element(class: 'login').click
end


def auto_user_as(log)
  @a.find_element(:id, 'username').send_keys log
  @a.find_element(:id, 'password').send_keys '123456'
  @a.find_element(:name, 'login').click
end

def open_projekt
  @a.find_element(class: 'projects').click
end

def click_projekt
  #@a.find_element(text_link: 'test_name1').click
  @a.get 'demo.redmine.org/projects/test_name1identifiee_1'
end


open_home_page
open_login
sleep 3
auto_user_as('447358')
sleep 3
open_projekt
sleep 3
click_projekt
