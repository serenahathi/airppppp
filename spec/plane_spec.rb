require 'plane'

describe Plane do
  let(:plane) { described_class.new }

  describe '#initialize' do
    it 'initializes with a flying status of true' do
      expect(plane.flying).to eq(true)
    end
  end

  describe '#update_status' do
    it 'toggles the plane\'s flying status to either true or false' do
      expect(plane.update_status).to be(true).or be(false)
    end
  end
end
