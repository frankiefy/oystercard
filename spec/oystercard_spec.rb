require 'oystercard'

describe Oystercard do
  it "checks the oystercard has a balance" do
    expect(subject).to respond_to(:balance)
  end

  it "checks that the Oystercard has a default balance of 0" do
    expect(subject.balance).to eq 0
  end

  it "can respond to the method top up" do
    expect(subject).to respond_to (:top_up)
  end

  it "the method top_up receives one argument" do
    expect(subject).to respond_to(:top_up).with(1).argument
  end

end
