require_relative 'oystercard'
require_relative 'journey'

class JourneyLog

attr_reader :current_journey

  def initialize(journey_class = Journey)
    @current_journey = nil
    @journey_class = journey_class
  end

  def start(entry_station)
    @current_journey = @journey_class.new(entry_station)
  end

end
