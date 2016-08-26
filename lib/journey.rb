require_relative 'oystercard'

class Journey

  PENALTY_CHARGE = 6

  attr_reader :journey, :completed

  def initialize(station)
    @journey = {entry: station, exit: nil}
    @completed = false
  end

  def start
    deduct(PENALTY_CHARGE)
  end

  def complete(station)
    @journey[:exit] = station
    @completed = true
  end

end
