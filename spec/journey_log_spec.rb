require 'journey_log'

describe JourneyLog do

  let(:journey) { double :journey }
  let(:station) { double :station }

  allow(journey).to receive(:journey) {entry: station, exit: nil}

 it 'should create a new array when initialized' do
   expect(subject.journey_log).to eq []
 end

 describe '#start' do

  it 'should return a new instance of journey' do
    subject.start("Bank")
    expect(journey_log.instance_variable_get(:@current_journey)).to eq {entry: "Bank", exit: nil}
  end

 end

end
