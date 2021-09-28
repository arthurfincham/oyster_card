require 'oystercard'

describe Oystercard do
  let(:station){ double :station } 
   it 'expects the card to remember the entry station after the touch in ' do 
    subject.top_up(5)
    subject.touch_in(station)
    expect(subject.entry_station).to eq station
   end

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

  describe '#touch in/out support' do

    it 'is not in journey by default' do
      expect(subject.in_journey).to eq false
    end

    context 'touch in'  do
      
      it 'updates in_journey value' do
        subject.top_up(5)
        subject.touch_in
        expect(subject).to be_in_journey
      end

      it 'expects to raise error if card balance is < 1£' do
        expect{ subject.touch_in }.to raise_error('Not enough money')
      end
    end

    context 'touch out' do

      before do
        subject.top_up(5) 
        subject.touch_in
      end
      
      it 'updates in_journey value' do
        subject.touch_out
        expect(subject).not_to be_in_journey
      end

      it 'deducts a fee for the journey' do
        expect{ subject.touch_out }.to change{ subject.balance }.by -Oystercard::FEE
      end
    end

  end
  

    
end