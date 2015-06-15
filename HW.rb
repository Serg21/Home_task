require 'selenium-webdriver'

@a = Selenium::WebDriver.for :firefox
@a.get 'http://demo.redmine.org'
@a.find_element(:class, 'login').click

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
  @a.get 'demo.redmine.org/projects/test_project_serg21identifiee_1'
end

def find_el (words)
  @a.find_element(:class, 'settings').click
  @a.find_element(:id, 'tab-members').click
  @a.find_element(:class, 'icon-add').click
  #@a.find_element(:class, 'ui-dialog ui-widget ui-widget-content ui-corner-all ui-front modal ui-draggable')
  @a.find_element(:id, 'principal_search').send_key words
end

def choose
  @a.find_element(:name, 'membership[user_ids][]').click
end

 def select_rol # niyak ne mojy inicializyvatu ci checkbox
   @a.find_element(:class, 'box')
   @a.find_element(:name, 'membership[role_ids][]').click
   @a.find_element(:id, 'member-add-submit').click
 end

#@random = 4.times.map{Random.rand('a'..'z')}.join
@random = (0..1).map{('a'..'z').to_a[rand(0..2)]}.join
#find_el

open_home_page
sleep 3
open_login
sleep 3
auto_user_as('447358')
sleep 3
open_projekt
sleep 3
click_projekt
sleep 3
find_el(@random)
sleep 3
choose
sleep 5
select_rol
sleep 5