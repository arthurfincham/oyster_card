# frozen_string_literal: true

require 'journey'



describe Journey do
  let(:station) { double :station }
  subject(:journey){described_class.new(station)}
  let(:station2) { double :station2 }

  describe '#attributes' do
    it 'entry station defaults to nil' do
      journey = Journey.new
      expect(journey.entry_station).to be_nil
    end

    it 'exit station defaults to nil' do
      journey = Journey.new
      expect(journey.exit_station).to be_nil
    end
  end

  describe '#start' do
    it 'updates its starting point' do
      expect(subject.entry_station).to eq station
    end

    it 'complete defaults to false' do
      expect(subject).to_not be_complete
    end
  end

  describe '#finish' do
    

    it 'responds to finish' do
      expect(subject).to respond_to(:finish).with(1).argument
    end

    it 'updates is exit point' do
      subject.finish(station2)
      expect(subject.exit_station).to eq station2
    end

    it 'marks itself as complete' do
      subject.finish(station2)
      expect(subject).to be_complete
    end
  end

  describe '#fare' do


    it 'deducts fare if journey is complete' do
      subject.finish(station2)
      expect(subject.fare).to eq Journey::FEE
    end

    it 'deducts additional penalty if missing station' do
      subject.finish(nil)
      expect(subject.fare).to eq Journey::FEE + Journey::PENALTY
    end
  end
end
