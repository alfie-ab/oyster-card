require_relative 'journey'
require_relative 'fare_calc'

class Oystercard

  attr_reader :limit, :fare, :entry_station, :journeys
  attr_accessor :current_journey, :balance

  DEFAULT_LIMIT = 90
  DEFAULT_BALANCE = 0
  MINIMUM_FARE = 1

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @current_journey = nil
  end

  def top_up(amount)
    fail 'Balance limit reached' if (@balance + amount) > DEFAULT_LIMIT
    @balance += amount
    balance_confirmation
  end

  def touch_in(station)
    fail 'Insufficient funds' if balance < MINIMUM_FARE
    fail 'must touch out first' if started?
    @current_journey = Journey.new(station)
  end

  def touch_out(station)
    fail "must touch in first" if !started?
    deduct(MINIMUM_FARE)
    @current_journey.complete(station)
    #@current_journey = nil
  end

  private

  attr_reader :balance_confirmation

  def deduct(amount)
    @balance -= amount
  end

  def started?
    @current_journey != nil
  end

  def balance_confirmation
    "Your new balance is #{balance}"
  end

end
