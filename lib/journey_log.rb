class JourneyLog
   
  attr_reader :journeys  
  
  def initialize(journey_class: Journey)
    @journey_class = journey_class
    @journeys = []
  end

  def start(station)
    @journeys << @journey_class.new(entry_station: station)
  end

  def finish(station)
    @journeys.last.exit_station = station
  end

end