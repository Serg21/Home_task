require 'selenium-webdriver'

#Primitive class Pool
#Pool
#deep
#bulk
#lenght
#width
#status

class Pool
  def deep
   rand(100)
  end
  def bulk
   @bulk=1010101
  end
  def lenght=(lenght_value)
   @lenght = lenght_value
  end
  def status=(open)
   @status = open
  end
  attr_accessor :width

end

pool1 = Pool.new
p pool1.deep

pool3 = Pool.new
puts pool3.bulk

pool4 = Pool.new
puts pool4.lenght = 10
puts pool4.lenght =(999)

pool5 = Pool.new
puts pool5.status = 'From dusk till dawn'

pool6 = Pool.new
puts pool6.width = 1
