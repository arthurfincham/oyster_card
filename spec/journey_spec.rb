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

    it 'complete defaults to false' do
      expect(subject.complete).to be_falsey
    end
  end

  describe '#start' do
    subject { Journey.new(station) }
    it 'updates its starting point' do
      expect(subject.entry_station).to eq station
    end
  end

  describe '#finish' do
    let(:station2) { double :station2 }
    before do
      subject { Journey.new(station) }
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
      expect(subject.complete).to eq true
    end
  end
end
