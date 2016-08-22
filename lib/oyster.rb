

class Oyster
  attr_reader :balance, :entry_station

  STARTING_BALANCE = 0.0
  MAX_BALANCE = 90.0
  MINIMUM_FARE = 1.0

  def initialize(balance = STARTING_BALANCE)
    @balance = balance
    @in_journey = false
  end

  def in_journey?
    if @entry_station == nil
      @in_journey = false
    else
      @in_journey = true
    end
  end

  def touch_in(entry_station)
    fail "Not enough money on card." if @balance < MINIMUM_FARE
    @entry_station = entry_station
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end

  def top_up(amount)
    fail "Oyster max balance is #{MAX_BALANCE}." if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end
end
