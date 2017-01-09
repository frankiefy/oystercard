class Oystercard

MAX_BALANCE = 90.00

 def initialize
   @balance = 0.00
 end

 def top_up(value)
   @balance += value
 end

 attr_reader :balance

end
