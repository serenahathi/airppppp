require 'airport'
require 'plane'
require 'weather'

describe Airport do
  let(:weather) { Weather.new }
  let(:airport) { described_class.new(weather) }
  let(:plane_one)   { double('a plane', :update_status => true, :flying => true) }
  let(:plane_two)   { double('a plane', :update_status => false, :flying => false) }

  describe '#initialize' do
    it 'initializes with an empty hangar' do
      expect(airport.hangar).to eq([])
    end

    it 'sets the default capacity to 10' do
      expect(airport.capacity).to eq(10)
    end
  end

  describe '#land' do
    context 'when not stormy' do
      before do
        allow(weather).to receive(:stormy?).and_return(false)
        airport.land(plane_one)
      end

      it 'stores a landed plane' do
        expect(airport.hangar).to eq([plane_one])
      end

      it 'raises an error if plane has already landed' do
        expect { airport.land(plane_one) }.to raise_error('Plane already landed')
      end

      it 'raises an error when airport is full' do
        10.times { airport.land(Plane.new) }
        expect { airport.land(plane_one) }.to raise_error('Plane cannot land: capacity reached')
      end
    end

    context 'when stormy' do
      it 'prevents a plane from landing in stormy weather' do
        allow(weather).to receive(:stormy?).and_return(true)
        expect { airport.land(plane_one) }.to raise_error('Plane cannot land or take off in stormy weather')
      end
    end
  end

  describe '#take_off' do
  context 'when not stormy' do
    before do
      allow(weather).to receive(:stormy?).and_return(false)
      airport.land(plane_two)
      # allow(weather).to receive(:stormy?).and_return(false)
    end

    it 'allows a landed plane to take off' do
      airport.take_off(plane_two)
      expect(airport.hangar).not_to include(plane_two)
    end

    it 'raises an error if plane has already taken off' do
      airport.take_off(plane_two)
      expect { airport.take_off(plane_two) }.to raise_error('Plane has already taken off')
    end
  end

  context 'when stormy' do
    before do
      allow(weather).to receive(:stormy?).and_return(false)
      airport.land(plane_two)
    end

    it 'prevents a plane from taking off in stormy weather' do
      allow(weather).to receive(:stormy?).and_return(true)
      airport.take_off(plane_two)
      expect { airport.land(plane_two) }.to raise_error('Plane cannot land or take off in stormy weather')
    end
  end
end

  describe '#capacity' do
    it 'allows the capacity to be overidden as appropriate' do
      airport.capacity = 50
      expect(airport.capacity).to eq 50
    end
  end
end