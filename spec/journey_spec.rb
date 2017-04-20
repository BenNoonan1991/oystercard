require "journey"
require "oystercard"
require "station"

describe Journey do
  let(:oystercard) {Oystercard.new}
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  let(:journey) { {entry_station => exit_station} }
  it "creates a new instance" do
    expect(subject).to eq subject
  end

    context 'tops up card and touches in' do
      before { oystercard.top_up(Oystercard::FARE) }
      before { oystercard.touch_in(entry_station) }

      describe '@journeys' do
        it 'check that journey is created after touching in/out' do
          oystercard.touch_out(exit_station)
          expect(oystercard.journeys).not_to be_empty
        end
      end

      describe "#journey" do
        it 'stores a journey' do
          oystercard.touch_out(exit_station)
          expect(oystercard.journeys).to include journey
        end
        it 'stores the entry station' do
          expect(oystercard.entry_station).to eq [entry_station]
        end
      end
    end
  end
