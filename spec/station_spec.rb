require './lib/station'

describe Station do
  subject(:station) { described_class.new }

  it 'creates a new instance of Station' do
    expect(station).to eq station
  end
end
