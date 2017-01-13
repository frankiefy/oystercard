require 'journey_log'
require 'oystercard'

describe JourneyLog do
  subject(:log) { described_class.new}
  it "is an instance of JourneyLog class" do
    expect(subject).to be_a(JourneyLog)
  end

  it {is_expected.to respond_to(:journeys)}
  it {is_expected.to respond_to(:journey_class)}
  it {is_expected.to respond_to(:start_journey).with(1).argument}
  it {is_expected.to respond_to(:finish_journey).with(1).argument}

=begin
  it "hold the history of the card"
    card1 = Oystercard.new
    card1.touch_in("bank")
    card1.touch_out("victoria")
    expect(card1_journey_log).to be()
=end



end
