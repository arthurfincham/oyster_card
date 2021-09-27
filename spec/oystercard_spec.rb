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
  end
  

    
end