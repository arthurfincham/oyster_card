require 'journey'

describe Journey do

  context '#attributes' do
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
    
end