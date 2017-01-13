require './lib/journey_log'
class Oystercard

MAX_BALANCE = 90.00
MIN_BALANCE = 1.00

 attr_reader :balance, :deduct, :fare, :entry_station, :journey_history, :journey_log1

 def initialize
   @balance = 0.00
   @journey_history =[]
   @current_journey = nil
   @journey_log1 = JourneyLog.new
 end

 def top_up(value)
   raise "Exceeded maximum balance £#{MAX_BALANCE}" if exceed_max(value)
   @balance += value
 end

 def touch_in(station)
   raise "Insufficient funds for this journey" if insufficient_funds
   @journey_log1.start_journey(station)
   deduct(6) if journey_log1.penalty == true
 end

 def touch_out(station)
    journey_log1.finish_journey(station)
    deduct(1) if journey_log1.penalty == false
    deduct(6) if journey_log1.penalty == true
 end

 def in_journey?
   !(@entry_station == nil)
 end




private


def deduct(fare)
  @balance -= fare
end


 def insufficient_funds
   @balance < MIN_BALANCE
 end

 def exceed_max(value)
  (@balance + value) > MAX_BALANCE
 end

 def not_touched_in(station)
   @current_journey = Journey.new
   @current_journey.finish(station)
 end

 def touched_in(station)
   @journey_history << {entry: @current_journey.entry_station, exit: station}
   @current_journey.finish(station)
   @current_journey = nil
 end

end
