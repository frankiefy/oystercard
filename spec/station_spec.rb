require 'station'

describe Station do
  subject(:station) {Station.new("Waterloo", 1)}

  it "should assign entry_station as an instance variable" do
    expect(station).to have_attributes(:name => "Waterloo", :zone => 1)
  end
end
