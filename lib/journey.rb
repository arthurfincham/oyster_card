# frozen_string_literal: true
require 'oystercard'

class Journey
  attr_accessor :entry_station, :exit_station, :fare

  FEE = 1
  PENALTY = 5

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @exit_station = nil
  end

  def finish(station)
    @exit_station = station
    self
  end

  def fare
    if complete?
      calculate_fee
    else
      PENALTY
    end
  end

  
  def complete?
    if (@entry_station == nil) or (@exit_station == nil)
      false
    else
      true
    end
  end
  
  private
  def calculate_fee
    a = @entry_station.zone
    b = @exit_station.zone
    (a - b).abs + 1
  end

  
end
