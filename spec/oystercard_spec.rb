require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }
  let(:in_journey) { double :in_journey}
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  let(:journey) { {entry_station => exit_station} }

  it "has an empty list of journeys by default" do
    expect(subject.journeys).to be_empty
  end

  context 'tops up card and touches in' do
    before { oystercard.top_up(Oystercard::FARE) }
    before { oystercard.touch_in(entry_station) }

    it 'stores a journey' do
      oystercard.touch_out(exit_station)
      expect(oystercard.journeys).to include journey
    end
    it 'stores the entry station' do
      expect(oystercard.entry_station).to eq [entry_station]
    end
  end

    describe "#balance" do
      it "should return 0 balance" do
        expect(oystercard.balance).to eq(0)
      end
    end

    describe "#top_up" do
      it "Expects #top_up to change balance" do
        expect{oystercard.top_up(Oystercard::FARE)}.to change{ oystercard.balance }.by(Oystercard::FARE)
      end

      it "should raise error if top up breaches limit (£90)" do
        expect{oystercard.top_up(Oystercard::DEFAULT_LIMIT + 1)}.to raise_error "Top-up is over maximum balance #{oystercard.limit}"
      end
    end

    describe '#touch_in' do
      it "it changes #in_journey to true" do
        oystercard.top_up(Oystercard::FARE)
        oystercard.touch_in(entry_station)
        expect(oystercard).to be_in_journey
      end
      it "raises error if funds below £1" do
      expect{oystercard.touch_in(entry_station)}.to raise_error "Funds too low"
    end
  end

    describe '#touch_out' do
      it "it changes #in_journey to false" do
        oystercard.top_up(10)
        oystercard.touch_in(entry_station)
        oystercard.touch_out(exit_station)
        expect(oystercard.in_journey?).to eq false
     end
      it "deducts fare amount on touch out" do
        oystercard.top_up(10)
        oystercard.touch_in(entry_station)
        expect { oystercard.touch_out(exit_station) }.to change{oystercard.balance}.by(-Oystercard::FARE)
      end
    end

    describe '@journeys' do
      it 'check that journey is created after touching in/out' do
        oystercard.top_up(10)
        oystercard.touch_in(entry_station)
        oystercard.touch_out(exit_station)
        expect(oystercard.journeys).not_to be_empty
      end
    end
end
