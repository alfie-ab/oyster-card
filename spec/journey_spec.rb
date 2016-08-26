require 'journey'

describe Journey do


  subject {described_class.new("startstation")}


  it 'initializes with a start' do
    expect(Journey.new('start').journey[:entry]).to eq 'start'
  end

  it 'returns true if journey is complete' do
    subject.complete("station")
    expect(subject.completed).to be true
  end

  it 'stores a journey' do
    subject.complete("stationexit")
    expect(subject.journey).to eq({entry: "startstation" , exit: "stationexit"})
  end


end
