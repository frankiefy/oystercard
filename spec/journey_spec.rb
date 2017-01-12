require 'journey'

describe Journey do
  subject(:journey) {Journey.new("Waterloo")}

  it "assigns the arguments passed in to entry_station and entry_zone" do
    expect(journey).to have_attributes(:entry_station => "Waterloo")
  end

  it { is_expected.to respond_to(:finish) }

  it { is_expected.to respond_to(:fare) }

  it {is_expected.to respond_to(:complete?) }

end
