require 'oystercard'

describe Oystercard do

  context '#configuration' do
    it 'has default balance of 0' do
    expect(subject.balance).to eq 0
    end
  end
 
  describe "#top_up" do
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

  describe "#deduct" do 

    it { is_expected.to respond_to(:deduct).with(1).argument }

    it "deducts an amount from the card's balance" do
      subject.top_up(10)
      expect { subject.deduct 3 }.to change{ subject.balance }.by -3
    end
  end
  

    
end