# frozen_string_literal: true

require 'station'

describe Station do
  context '#attributes' do
    it 'has required attributes' do
      station = Station.new('NHG', 2)
      expect(station).to have_attributes(name: 'NHG', zone: 2)
    end

    it 'knows its name' do
      station = Station.new('NHG', 2)
      expect(station.name).to eq('NHG')
    end

    it 'knows its zone' do
      station = Station.new('NHG', 2)
      expect(station.zone).to eq(2)
    end
  end
end
