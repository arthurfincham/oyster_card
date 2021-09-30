require 'oystercard'
require 'journey'
class JourneyLog
   
  attr_reader :journeys  
  
  def initialize(journey_class: Journey)
    @journey_class = journey_class
    @journeys = []
  end

  def start(station)
    @journeys << @journey_class.new(station)
  end

  def finish(station)
    current_journey.finish(station)
  end

  def current_journey
    incomplete_journey || @journey_class.new
  end

  def incomplete_journey
    @journeys.reject(&:complete?).first
  end

end