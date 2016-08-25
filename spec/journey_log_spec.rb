require 'journey_log'

describe JourneyLog do

  let(:entry_station) { double :entry_station }

  it 'should be able to receive the start method' do
    subject.start(entry_station)
    expect(subject.instance_variable_get(:@current_journey)).not_to eq nil
  end

end
