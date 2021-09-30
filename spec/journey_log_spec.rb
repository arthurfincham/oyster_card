require 'journey_log'

describe JourneyLog do
    let(:journey){ double :journey}
    let(:station){ double :station }
    let(:station2){ double :station2 }
    let(:journey_class){ double :journey_class, new: journey}
    subject {described_class.new(journey_class: journey_class)}
    
    context ".start" do
      it 'starts a journey' do  
        expect(journey_class).to receive(:new).with(station)
        subject.start(station)
      end

      it 'records a journey' do
          allow(journey_class).to receive(:new).and_return journey
          subject.start(station)
          expect(subject.journeys).to include journey 
      end
    end 

    context ".finish" do
      it 'stops a journey' do
        expect(journey_class).to receive(:new).with(station)
        subject.start(station)
        allow(journey).to receive(:finish)
        subject.finish(station2)
      end

      it 'records a journey' do
        allow(journey_class).to receive(:new).and_return journey
        subject.start(station)
        allow(journey).to receive(:finish)
        subject.finish(station2)
        expect(subject.journeys).to include journey 
      end
    end
end


