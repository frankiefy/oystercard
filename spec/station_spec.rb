require 'station'

describe Station do

  subject(:bank) { described_class.new "bank" }
  subject(:leyton) { described_class.new "leyton" }

  describe 'class initiation' do
    it 'creates an instance of station' do
      expect(bank).to be_a(Station)
    end
    it 'knows its name' do
      expect(bank.name).to eq("bank")
    end
  end

  describe 'zone variable' do
    it 'passes zone to a station when station is created' do
      expect(bank.zone).to eq(1)
    end
    it 'finds different zones for different stations' do
      expect(leyton.zone).to eq(3)
    end
  end

end
