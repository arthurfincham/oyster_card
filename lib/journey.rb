# frozen_string_literal: true

class Journey
  attr_accessor :entry_station, :exit_station, :complete

  FEE = 1
  PENALTY = 5

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @exit_station = nil
    @complete = false
  end

  def finish(station)
    @exit_station = station
    @complete = true
    self
  end

  def fare
    penalty? ? FEE + PENALTY : FEE
  end

  def penalty?
    (!entry_station || !exit_station) 
  end
end
