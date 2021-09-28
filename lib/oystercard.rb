class Oystercard

  attr_accessor :balance
  attr_reader :entry_station

  LIMIT = 90
  FEE = 1 

  def initialize
    @balance = 0
    @entry_station = nil
  end

  def top_up(value)
    raise("Too much! Top up limit is £#{LIMIT}") if (@balance + value) > 90
    @balance += value
  end

  def in_journey

    @in_journey
  end

  def touch_in(station)
    raise 'Not enough money' if @balance < FEE
    @entry_station = station
  end

  def touch_out
    @in_journey = false
    deduct
  end

  private 

  def deduct(fee = FEE)
    @balance -= fee
  end

end