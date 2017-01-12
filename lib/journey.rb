class Journey
  MIN_FARE = 1
  MIN_PENALTY = 5
  attr_reader :exit_station, :entry_station, :entry_zone, :finish, :fare

  def initialize(entry_station = nil, exit_station = nil)
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def start_journey(station)
    @entry_station = station
  end

  def finish(station)
    @exit_station = station
  end

  def fare
    MIN_FARE
  end

  def complete?
    !!(@entry_station && @exit_station)
  end
end
