require './lib/journey'

class Oystercard
  attr_reader :limit, :balance
  attr_writer :in_journey

  DEFAULT_LIMIT = 90
  FARE = 1

  def initialize (balance = 0, limit = DEFAULT_LIMIT)
    @balance = balance
    @limit = limit
    @in_journey = false
    @journey = Journey.new
  end

  def top_up(amount = 0)
    raise "Top-up is over maximum balance #{self.limit}" if (self.balance + amount > self.limit)
    increment_balance(amount)
  end

  def touch_in(station)
    raise "Funds too low" if self.balance < FARE
    self.in_journey = true
    @journey.entry_station << station
  end

  def touch_out(station)
    self.in_journey = false
    deduct
    @journey.exit_station << station
    @journey.finish
  end

  def in_journey?
    !!@in_journey
  end

  private
  attr_writer :deduct
  attr_writer :balance

  def increment_balance(amount)
    self.balance += amount
  end

  def deduct
    self.balance -= FARE
  end

end
