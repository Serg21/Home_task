require 'selenium-webdriver'

@a = Selenium::WebDriver.for :firefox
@a.get 'http://demo.redmine.org'

def reg_user_as(log)
  @a.find_element(:class, 'register').click
  @a.find_element(:name, 'user[login]').send_keys log
  @a.find_element(:name, 'user[password]').send_keys '123456'
  @a.find_element(:name, 'user[password_confirmation]').send_keys '123456'
  @a.find_element(:name, 'user[firstname]').send_keys 'Serg'
  @a.find_element(:name, 'user[lastname]').send_keys 'Serg_1'
  @a.find_element(:name, 'user[mail]').send_keys(log + '@mailinator.com')
  @a.find_element(:name, 'user[language]').send_key
  @a.find_element(:name, 'commit').click
end


def change_pass(pass)
  @a.find_element(:class, 'my-account').click
  @a.find_element(:class, 'icon-passwd').click
  @a.find_element(:id, 'password').send_keys '123456'
  @a.find_element(:id, 'new_password').send_keys pass#'222222'
  @a.find_element(:id, 'new_password_confirmation').send_keys pass#'222222'
  @a.find_element(:name, 'commit').click
end


def create_proj(haos)
  @a.find_element(:class, 'projects').click
  @a.find_element(:class, 'icon-add').click
  @a.find_element(:id, 'project_name').send_key 'Test_Serg_'+haos
  @a.find_element(:id, 'project_description').send_key haos
  @a.find_element(:id, 'project_identifier').send_key haos
  @a.find_element(:id, 'project_homepage').send_key haos
  @a.find_element(:name, 'commit').click
end

def add_user#(words)
 # @a.find_element(:class, 'settings').click
  @a.find_element(:id, 'tab-members').click
  @a.find_element(:class, 'icon-add').click
  #@a.find_element(:id, 'principal_search').send_key #words
end

def choose_user
  @a.find_element(:name, 'membership[user_ids][]').click
end

def select_rol_developer# niyak ne mojy inicializyvatu ci checkbox
  a = @a.find_elements(:css, '.roles-selection>label')
  puts a.inspect
  b = a.map{|el| el.text()}
  puts b.inspect
  index = b.index('Developer')
  select_rol_developer = a.at(index)
  select_rol_developer.click
  @a.find_element(:id, 'member-add-submit').click
end

def select_rol_reporter
  @a.find_element(:class, 'icon-add').click
  @a.find_element(:id, 'tab-members').click
  @a.find_element(:class, 'icon-add').click
  @a.find_element(:css, '.pagination>a').click
  @a.find_element(:name, 'membership[user_ids][]').click
  a = @a.find_elements(:css, '.roles-selection>label')
  b = a.map{|el| el.text()}
  index = b.index('Reporter')
  select_rol_developer = a.at(index)
  select_rol_developer.click
  @a.find_element(:id, 'member-add-submit').click
end


@random =7.times.map{Random.rand(9)}.join
reg_user_as(@random)
fail 'lol_reg :(' unless @a.find_element(:id, 'flash_notice').text == 'Your account has been activated. You can now log in.'
sleep 3

change_pass(@random)
fail 'lol_change:(' unless @a.find_element(:id, 'flash_notice').text == 'Password was successfully updated.'
sleep 3

@random1 = (0..4).map{('a'..'z').to_a[rand(0..8)]}.join
create_proj(@random1)
fail 'lol_create :(' unless @a.find_element(:id, 'flash_notice').text == 'Successful creation.'
sleep 5

#@random1 = (1).map{('a'..'z').to_a[rand(0..2)]}.join
add_user#(@random1)
sleep 4

choose_user

select_rol_developer
fail 'lol_create_developer' unless @a.find_element(:id, 'flash_notice').text == 'Successful creation.'
sleep 3

select_rol_reporter
fail 'lol_create_reporter' unless @a.find_element(:id, 'flash_notice').text == 'Successful creation.'
sleep 3

#@a.close