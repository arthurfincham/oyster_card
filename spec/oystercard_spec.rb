require 'oystercard'

describe Oystercard do

  context '#configuration' do
    it 'has default balance of 0' do
    expect(subject.balance).to eq 0
    end
  end
    
end