require_relative 'station'
require_relative 'journey'

class Oyster
  attr_reader :balance, :entry_station, :journeys

  STARTING_BALANCE = 0.0
  MAX_BALANCE = 90.0
  MINIMUM_FARE = 1.0
  PENALTY_FARE = 10.0

  def initialize(balance = STARTING_BALANCE)
    @balance = balance
    @in_journey = false
    @journeys = []
  end

  def in_journey?
    if @entry_station == nil
      @in_journey = false
    else
      @in_journey = true
    end
  end

  def touch_in(entry_station)
    no_touch_out if @entry_station != nil
    fail "Not enough money on card." if @balance < MINIMUM_FARE
    @entry_station = entry_station
    in_journey?
  end

  def touch_out(exit_station)
    record_journey(@entry_station, exit_station)
    deduct(MINIMUM_FARE)
    @exit_station = exit_station
    @entry_station = nil #must be last line of method (or very near
    in_journey?
  end

  def top_up(amount)
    fail "Oyster max balance is #{MAX_BALANCE}." if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  private

  def no_touch_out #if the person did not touch out of last journey
    record_journey(@entry_station, nil)
    deduct(PENALTY_FARE)
    @entry_station = nil
  end

  def record_journey(entry_station, exit_station)
    @journeys << {:entry => entry_station, :exit => exit_station}
  end

  def deduct(amount)
    @balance -= amount
  end
end
