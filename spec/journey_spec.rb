# frozen_string_literal: true

require 'journey'

describe Journey do
  let(:station) { double :station }

  describe '#attributes' do
    it 'entry station defaults to nil' do
      expect(subject.entry_station).to be_nil
    end

    it 'exit station defaults to nil' do
      expect(subject.exit_station).to be_nil
    end

  end

  describe '#start' do
    subject { Journey.new }
    it 'updates its starting point' do
      subject.start(station)
      expect(subject.entry_station).to eq station
    end

    it 'complete defaults to false' do
      expect(subject).to_not be_complete
    end
  end

  describe '#finish' do
    let(:station2) { double :station2 }
    before do
      subject{ Journey.new }
      subject.start(station)
    end

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
    subject{ Journey.new }
    let(:station2) { double :station2 }

    it 'deducts fare if journey is complete' do
      subject.start(station)
      subject.finish(station2)
      expect(subject.fare).to eq Journey::FEE
    end

    it 'deducts additional penalty if missing station' do
      subject.start(nil)
      subject.finish(station2)
      expect(subject.fare).to eq Journey::FEE + Journey::PENALTY
    end
  end
end
