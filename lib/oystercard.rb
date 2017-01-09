class Oystercard

 def initialize
   @balance = 0.00
 end

 def top_up(value)
   @balance += value
 end

 attr_reader :balance

end
