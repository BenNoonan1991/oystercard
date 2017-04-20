require './lib/station'

describe Station do
  subject(:station) { described_class.new }

    it "checks zone variable is responding" do
      expect(:zone).not_to be_nil
    end

    it "checks name variable is repsonding" do
      expect(:name).not_to be_nil
    end

    it 'creates a new instance of Station' do
      expect(station).to eq station
    end
  end
