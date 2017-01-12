class Journey

  attr_reader :entry_station, :entry_zone, :finish, :fare

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
    deduct(1.00)
  end

  def complete?
      !!(@entry_station && @exit_station)
  end
end
