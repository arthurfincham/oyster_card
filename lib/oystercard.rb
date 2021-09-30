# frozen_string_literal: true

require_relative 'journey'
require_relative 'journey_log'

class Oystercard
  attr_accessor :balance
  attr_reader :journey_log

  LIMIT = 90

  def initialize(journey_log: JourneyLog.new)
    @balance = 0
    @journey_log = journey_log
  end

  def top_up(value)
    raise("Too much! Top up limit is £#{LIMIT}") if (@balance + value) > 90

    @balance += value
  end

  def touch_in(station = nil)
    raise 'Not enough money' if @balance < Journey::FEE
    @journey_log.start(station)
  end

  def touch_out(station = nil)
    @journey_log.finish(station)
    deduct
  end

  private

  def deduct
    @balance -= @journey_log.journeys.last.fare
  end

end
