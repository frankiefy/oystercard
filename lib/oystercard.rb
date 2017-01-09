class Oystercard

MAX_BALANCE = 90.00
MIN_BALANCE = 1.00

 attr_reader :balance, :in_journey, :deduct, :fare

 def initialize
   @balance = 0.00
   @in_journey = false
 end

 def top_up(value)
   raise "Exceeded maximum balance £#{MAX_BALANCE}" if exceed_max(value)
   @balance += value
 end

 def exceed_max(value)
  (@balance + value) > MAX_BALANCE
 end

 def touch_in
   raise "Insufficient funds for this journey" if insufficient_funds
  @in_journey = true
 end

 def touch_out
   deduct(1.00)
  @in_journey = false
 end

 def in_journey?
   @in_journey
 end

 def insufficient_funds
   @balance < MIN_BALANCE
 end

private
 def deduct(fare)
  @balance -= fare
 end

end
