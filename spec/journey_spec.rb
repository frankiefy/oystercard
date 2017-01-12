require 'journey'

describe Journey do
  subject(:journey) {Journey.new("Waterloo")}

  it "assigns the arguments passed in to entry_station" do
    expect(journey).to have_attributes(:entry_station => "Waterloo")
  end

  it "expects complete? to be false" do
    expect(journey.complete?).to eq(false)
  end

  it { is_expected.to respond_to(:finish) }

  it { is_expected.to respond_to(:fare) }

  it {is_expected.to respond_to(:complete?) }

  describe "complete journey" do
    subject(:journey) {Journey.new("Waterloo", "Bank")}
    it "assigns the arguments passed in to entry_station and exit_station" do
      expect(journey).to have_attributes(:entry_station => "Waterloo", :exit_station => "Bank")
    end

    it "expects complete? to be true" do
      expect(journey.complete?).to eq(true)
    end
  end
end
