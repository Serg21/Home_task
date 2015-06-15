require 'selenium-webdriver'

#@a = Selenium::WebDriver.for :firefox
#@a.get 'http://demo.redmine.org'

class First_Name
 def f_name
   @random = (0..3).map{('a'..'z').to_à[rand(0..4)]}.join
 end
end

fname1 = First_Name.new
fname2 = First_Name.new
puts fname1.f_name
puts fname2.f_name

class Last_Name
  def l_name
    @random = (0..5).map{('a'..'z').to_a[rand(0..6)]}.join
  end
end

lname1 = Last_Name.new
lname2 = Last_Name.new
puts lname1.l_name
puts lname2.l_name



#login = User.new
#password = User.new
#f_name = User.new
#l_name = User.new
#email = User.new
#language = User.new

