# class JourneyLog

#   attr_reader :journeys

#   def initialize(journey_class: Journey)
#     @journey_class = journey_class
#     @journeys = []
#   end

#   def start(station)
#     log(@journey_class.new(entry_station: station))
#   end

#   def finish(station)
#     @journeys.last.exit_station = station
#   end

# private

#   def log(journey)
#     @journeys << journey
#   end

#   def current_journey
#     @journeys.last ||= journey_class.new
#   end
# end