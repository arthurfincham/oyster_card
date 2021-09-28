require 'journey'

describe Journey do

  # let(:station){ double :station }
  context '#attributes' do
    
    it 'has required attributes' do
      station = double("Station")
      journey = Journey.new(station)
      expect(journey).to have_attributes(:entry_station => station, :exit_station => nil)
    end                                        
  end

  context '#tap_out' do
    it 'completes the instance of journey' do
      oyster = double("Oyster", :tap_out)
      journey = Journey.new(station)
      oyster.tap_out(station)
      expect(journey.exit_station).to eq station
    end
  end
end