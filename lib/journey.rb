require './lib/oystercard'

class Journey

  PENALTY_FARE = 6

  attr_reader :entry_station, :exit_station, :journeys
  attr_writer :journeys

  def initialize(entry_station = PENALTY_FARE)
    @entry_station =[]
    @exit_station = []
    @journeys = {}
  end

  def finish
    @journeys = Hash[@entry_station.zip(@exit_station)]
  end

end
