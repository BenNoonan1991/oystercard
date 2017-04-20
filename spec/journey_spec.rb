require "journey"

describe Journey do
  let(:oystercard) { double :oystercard }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }

  it "creates a new instance" do
    expect(subject).to eq subject
  end

  it "has an empty list of journeys by default" do
    expect(subject.journeys).to be_empty
  end

  it "returns journey list" do
    expect(subject.finish).to be_empty
  end

  # describe '@journeys' do
  #   it 'check that journey is created after touching in/out' do
  #     oystercard.top_up(90)
  #     oystercard.touch_in(station)
  #     oystercard.touch_out(station)
  #     expect(oystercard.journeys).not_to be_empty
  #   end
  # end

  # describe "#journey" do
  #     it 'stores a journey' do
  #     oystercard.touch_out(exit_station)
  #     expect(oystercard.journeys).to include journey
  #   end
  #   it 'stores the entry station' do
  #     expect(oystercard.entry_station).to eq [entry_station]
  #   end
  # end

end
