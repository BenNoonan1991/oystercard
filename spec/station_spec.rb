require './lib/station'

describe Station do
  subject {described_class.new(name: "Old Street", zone: 1)}

  it "checks zone variable is responding" do
    expect(:zone).not_to be_nil
  end

  it "checks name variable is repsonding" do
    expect(:name).not_to be_nil
  end

  it 'creates a new instance of Station' do
    expect(subject).to eq subject
  end

  it "knows its name" do
    expect(subject.name).to eq("Old Street")
  end

  it "knows its zone" do
    expect(subject.zone).to eq(1)
  end

end
