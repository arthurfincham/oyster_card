# frozen_string_literal: true

require_relative 'journey'

class Oystercard
  attr_accessor :balance
  attr_reader :journey_history

  LIMIT = 90

  def initialize
    @balance = 0
    @journey_history = []
  end

  def top_up(value)
    raise("Too much! Top up limit is £#{LIMIT}") if (@balance + value) > 90

    @balance += value
  end

  def touch_in(station)
    raise 'Not enough money' if @balance < Journey::FEE

    @journey = Journey.new(station)
  end

  def touch_out(station)
    @journey.finish(station)
    @journey_history << @journey
    deduct
  end

  private

  def deduct
    @balance -= @journey.fare
  end
end
