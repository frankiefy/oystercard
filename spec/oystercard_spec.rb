require 'oystercard'

describe Oystercard do
  subject(:oystercard) {Oystercard.new}
  let(:station) {double :station}


  describe "initialization tests" do

    it "should assign an empty array to journey_history" do
      expect(oystercard).to have_attributes(:journey_history => [])
    end

    it "should assign entry_station as an instance variable" do
      expect(oystercard).to have_attributes(:entry_station => nil)
    end

    it "expects to have a constant - MIN_BALANCE" do
      expect(Oystercard).to be_const_defined(:MIN_BALANCE)
    end

    it "checks that the Oystercard has a default balance of 0" do
      expect(oystercard.balance).to eq 0
    end

    it "expects to have a constant - MAX_BALANCE" do
      expect(Oystercard).to be_const_defined(:MAX_BALANCE)
    end
  end

  describe "#top_up" do

    it {is_expected.to respond_to(:top_up)}

    it "the method top_up receives one argument" do
      expect(oystercard).to respond_to(:top_up).with(1).argument
    end

    it "adds the top up value to the card balance" do
        expect{oystercard.top_up(5.00)}.to change{subject.balance}.by(5.00)
    end
  end


  describe "#balance" do

    it {is_expected.to respond_to(:balance)}

    context "user attempts to top_up with more than maximum balance" do

      it "raises an error if balance exceeds MAX_BALANCE" do
        expect { oystercard.top_up(100.00) }.to raise_error(RuntimeError,"Exceeded maximum balance £#{Oystercard::MAX_BALANCE}")
      end
    end
  end

  
  it { is_expected.to respond_to(:exceed_max) }

  it {is_expected.to respond_to(:in_journey?)}

  it "returns 'in use' when card is in journey" do
    expect(oystercard.in_journey?).to eq false
  end

  it {is_expected.to respond_to(:touch_in)}

  it "@in_journey is true when method touch_in is called" do
    oystercard.top_up(10.00)
    oystercard.touch_in(:station)
    expect(oystercard.in_journey?).to eq true
  end

  it {is_expected.to respond_to(:touch_out)}

  it {is_expected.to respond_to(:in_journey?)}

  it "@in_journey is false when method touch_out is called" do
    oystercard.top_up(10.00)
    oystercard.touch_in(:station)
    oystercard.touch_out(:station)
    expect(oystercard.in_journey?).to eq false
  end

  it {is_expected.to respond_to(:insufficient_funds)}

  it "expects an error when trying to touch-in with insufficient funds" do
    expect{ (oystercard.touch_in(:station))}.to raise_error(RuntimeError, "Insufficient funds for this journey")
  end

  context "tests when oystercard is in_journey" do
    before(:each) do
      oystercard.top_up(25)
      oystercard.touch_in(:station)
    end

    it "should re-assign entry_station following touch_in" do
      expect(oystercard.entry_station).to eq :station
    end

    it "deducts minimum fare from balance when touching out" do
      expect{oystercard.touch_out(:station)}.to change{oystercard.balance}.by(-1.00)
    end
  end

  context "tests when journey is complete" do

    before(:each) do
      oystercard.top_up(25)
      oystercard.touch_in(:station)
      oystercard.touch_out(:station)
    end

    it "should re-assign entry_station following touch_out" do
      expect(oystercard.entry_station).to eq nil
    end

    it "should save journey history in instance variable" do
      expect(oystercard.journey_history).to eq [{entry: :station, exit: :station}]
    end
  end

end
