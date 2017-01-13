require './lib/journey'
class JourneyLog

  attr_reader :journeys, :journey_class, :start_journey, :a_journey, :penalty

def initialize
  @journeys = []
  @a_journey = nil
  @penalty = nil
end

def start_journey(entry_station)
  if a_journey != nil
  journeys << a_journey
  @a_journey = nil
  @penalty = true
  end
  @a_journey = Journey.new(entry_station)
  penalty = false
end

def finish_journey(exit_station)
  if @a_journey == nil
    @a_journey = Journey.new(nil)
    @penalty = true
    @a_journey.finish(exit_station)
    journeys << @a_journey
    @a_journey = nil
  else
    @a_journey.finish(exit_station)
    journeys << @a_journey
    @a_journey = nil
    @penalty = false
  end
end


private

def current_journey

end



end
