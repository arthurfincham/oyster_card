class Oystercard

  attr_accessor :balance

  LIMIT = 90
  FEE = 2 

  def initialize
    @balance = 0
  end

  def top_up(value)
    raise("Too much! Top up limit is £#{LIMIT}") if (@balance + value) > 90
    @balance += value
  end

  def deduct(fee = FEE)
    @balance -= fee
  end
end