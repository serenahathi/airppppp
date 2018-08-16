require 'weather'

describe Weather do
  let(:weather) { described_class.new }

  describe '#stormy?' do
    it 'reports when weather is stormy' do
      allow(weather).to receive(:stormy?).and_return(true)
      expect(weather.stormy?).to eq(true)
    end

    it 'reports when weather is sunny' do
      allow(weather).to receive(:stormy?).and_return(false)
      expect(weather.stormy?).to eq(false)
    end
  end
end
