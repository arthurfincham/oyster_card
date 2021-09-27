class Oystercard

  attr_accessor :balance
  attr_reader :in_journey

  LIMIT = 90
  FEE = 2 

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(value)
    raise("Too much! Top up limit is £#{LIMIT}") if (@balance + value) > 90
    @balance += value
  end

  def deduct(fee = FEE)
    @balance -= fee
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end