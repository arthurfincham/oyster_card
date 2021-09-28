require_relative 'journey'

class Oystercard

  attr_accessor :balance
  attr_reader :entry_station, :journey_history, :j

  LIMIT = 90
  FEE = 1 


  def initialize
    @balance = 0
    @entry_station = nil
    @journey_history = {}
  end

  def top_up(value)
    raise("Too much! Top up limit is £#{LIMIT}") if (@balance + value) > 90
    @balance += value
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_in(station)
    raise 'Not enough money' if @balance < FEE
    @entry_station = station
    @j = Journey.new(station)
    
  end

  def touch_out(station)
    @journey_history.store(@entry_station, station)
    @entry_station = nil
    @j.exit_station = station
    deduct
  end

  private 

  def deduct(fee = FEE)
    @balance -= fee
  end

end 