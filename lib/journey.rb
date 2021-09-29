class Journey
  attr_accessor :entry_station, :exit_station, :complete

  def initialize 
    @entry_station = nil
    @exit_station = nil
    @complete = false
  end
end