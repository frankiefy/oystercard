require 'oystercard'

describe Oystercard do

  it {is_expected.to respond_to(:balance)}

  it "checks that the Oystercard has a default balance of 0" do
    expect(subject.balance).to eq 0
  end

    it {is_expected.to respond_to(:top_up)}

  it "the method top_up receives one argument" do
    expect(subject).to respond_to(:top_up).with(1).argument
  end

  it "adds the top up value to the card balance" do
    subject.top_up(5.00)
    expect(subject.balance).to eq 5.00
  end

  it "expects to have a constant - MAX_BALANCE" do
    expect(Oystercard).to be_const_defined(:MAX_BALANCE)
  end

  it "expects an error if balance exceeds MAX_BALANCE" do
    expect { subject.top_up(100.00) }.to raise_error(RuntimeError,"Exceeded maximum balance £#{Oystercard::MAX_BALANCE}")
  end

  it { is_expected.to respond_to(:exceed_max) }

  it "can respond to a method deduct" do
    expect(subject).to respond_to(:deduct).with(1).argument
  end

  it "deducts fare from balance when deduct method is run" do
    subject.top_up(10.00)
    subject.deduct(2.80)
    expect(subject.balance).to eq 7.20
  end

  it {is_expected.to respond_to(:in_journey?)}

  it "returns 'in use' when card is in journey" do
    expect(subject.in_journey?).to eq "in use"
  end

end
