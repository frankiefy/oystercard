class Oystercard

MAX_BALANCE = 90.00
MIN_BALANCE = 1.00

 attr_reader :balance, :deduct, :fare, :entry_station, :journey_history

 def initialize
   @balance = 0.00
   @entry_station = nil
   @journey_history =[]
 end

 def top_up(value)
   raise "Exceeded maximum balance £#{MAX_BALANCE}" if exceed_max(value)
   @balance += value
 end

 def touch_in(station)
   raise "Insufficient funds for this journey" if insufficient_funds
    @journey_history << {entry:@entry_station, exit: nil} if @entry_station != nil
    @entry_station = station
 end

 def touch_out(station)
   deduct(1.00)
  @journey_history << {entry: @entry_station, exit: station}
  @entry_station = nil
 end

 def in_journey?
   !(@entry_station == nil)
 end

 def insufficient_funds
   @balance < MIN_BALANCE
 end

 def exceed_max(value)
  (@balance + value) > MAX_BALANCE
 end

private

 def deduct(fare)
  @balance -= fare
 end

end
