# frozen_string_literal: true

require 'oystercard'

class Journey
  attr_accessor :entry_station, :exit_station

  FEE = 1
  PENALTY = 5

  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def start(station)
    @entry_station = station
  end

  def finish(station)
    @exit_station = station
    self
  end

  def fare
    if complete?
      FEE
    else
      FEE + PENALTY
    end
  end

  def complete?
    @entry_station && @exit_station
  end

  
end
