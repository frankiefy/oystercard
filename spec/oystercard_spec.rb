

describe Oystercard do
  it "checks the oystercard has a balance" do
    expect(Oystercard).to respond to (:balance)
  end 

end
