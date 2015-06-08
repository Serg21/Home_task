#create projekt
require 'selenium-webdriver'

def auto_user_as(log)
  @a.find_element(:id, 'username').send_keys log
  @a.find_element(:id, 'password').send_keys '123456'
  @a.find_element(:name, 'login').click
  @a.find_element(:class, 'projects').click
  @a.find_element(:class, 'icon-add').click
  @a.find_element(:id, 'project_name').send_key 'test_name2'
  @a.find_element(:id, 'project_description').send_key 'dscription_1'
  @a.find_element(:id, 'project_identifier').send_key 'identifiee_1'
  @a.find_element(:id, 'project_homepage').send_key 'homepage_1'
  @a.find_element(:name, 'commit').click
end

@a = Selenium::WebDriver.for :firefox
@a.get 'http://demo.redmine.org'
@a.find_element(:class, 'login').click

auto_user_as(321883)

@a.find_element(:class, 'projects').click

sleep 5

@a.find_element(:class, 'icon-add').click

sleep 5

@a.find_element(:name, 'commit').click

#fail 'lol :(' unless @a.find_element(:id, 'flash_notice').text == 'Successful creation.'