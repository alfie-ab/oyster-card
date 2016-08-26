class JourneyLog

  attr_reader :journey_log

  def initialize(journey_class = Journey)
    @current_journey = nil
    @journey_class = journey_class
  end

  def start(station)
    @current_journey = @journey_class.new
  end

end
