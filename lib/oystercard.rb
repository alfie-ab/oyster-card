require_relative 'journey'
require_relative 'fare_calc'

class Oystercard

  attr_reader :current_journey, :balance

  DEFAULT_LIMIT = 90
  DEFAULT_BALANCE = 0
  MINIMUM_FARE = 1
  PENALTY_CHARGE = 6

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @current_journey = nil
    @journey_log = []
  end

  def top_up(amount)
    fail 'Balance limit reached' if (@balance + amount) > DEFAULT_LIMIT
    @balance += amount
    balance_confirmation
  end

  def touch_in(station)
    fail 'Insufficient funds' if balance < MINIMUM_FARE
    no_touch_out if !@current_journey.nil?
    @current_journey = Journey.new(station)
  end

  def touch_out(station)
    no_touch_in if @current_journey.nil?
    @current_journey.complete(station)
    @journey_log << @current_journey
    @current_journey = nil
  end

  private

  def no_touch_in
    @current_journey = Journey.new(nil)
    deduct(PENALTY_CHARGE)
  end

  def no_touch_out
    @current_journey.complete(nil)
    deduct(PENALTY_CHARGE)
    @journey_log << @current_journey
  end

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
