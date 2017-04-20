class Journey

  PENALTY_FARE = 6

  attr_reader :entry_station, :exit_station

  def initialize(entry_station = PENALTY_FARE)
    @entry_station = entry_station
    @exit_station = exit_station
  end

end
