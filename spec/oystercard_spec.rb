# frozen_string_literal: true

require 'oystercard'

describe Oystercard do
  let(:station) { double :station }

  context '#configuration' do
    it 'has default balance of 0' do
      expect(subject.balance).to eq 0
    end

    it 'checks that the card has an empty list of journeys by default' do
      expect(subject.journey_history).to be_empty
    end
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'tops up the balance to a passed value' do
      subject.top_up(10)
      expect(subject.balance).to eq 10
    end

    it 'throws an error if limit would be exceeded' do
      card_limit = Oystercard::LIMIT
      expect { subject.top_up(card_limit + 1) }.to raise_error("Too much! Top up limit is £#{Oystercard::LIMIT}")
    end
  end

  describe '#touch_in' do
    let(:journey) { double :journey, entry_station: station, complete?: false }

    it 'expects to raise error if card balance is < 1£' do
      expect { subject.touch_in(station) }.to raise_error('Not enough money')
    end
  end

  describe '#touch out' do
    before do
      subject.top_up(5)
      subject.touch_in(station)
    end

    it 'deducts a fee for the journey' do
      expect { subject.touch_out(station) }.to change { subject.balance }.by(-Journey::FEE)
    end

    it 'Write a test that checks that touching in and out creates one journey' do
      expect { subject.touch_out(station) }.to change { subject.journey_history.length }.by(1)
    end
  end
end
