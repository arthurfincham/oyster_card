class Oystercard

  attr_accessor :balance

  LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(value)
    raise("Too much! Top up limit is £#{LIMIT}") if (@balance + value) > 90
    @balance += value
  end
end