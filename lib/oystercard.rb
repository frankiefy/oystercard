class Oystercard

MAX_BALANCE = 90.00

 attr_reader :balance

 def initialize
   @balance = 0.00
 end

 def top_up(value)
   raise "Exceeded maximum balance £#{MAX_BALANCE}" if exceed_max(value)
   @balance += value
 end

def exceed_max(value)
  (@balance + value) > MAX_BALANCE
end

def deduct(fare)
  @balance -= fare
end

end
