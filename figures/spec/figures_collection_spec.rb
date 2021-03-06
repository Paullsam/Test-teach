RSpec.describe FiguresCollection do
  let(:collection) { described_class.new }
  let(:triangle) { Triangle.new side1: 6, side2: 8, side3: 10 }
  let(:square) { Square.new 10 }
  let(:rectangle) { Rectangle.new 5, 10 }
  let(:triangle2) { Triangle.new side1: 8, side2: 10, side3: 12 }
  let(:square2) { Square.new 8 }
  let(:rectangle2) { Rectangle.new 3, 6 }

  describe 'add' do
    subject { collection }

    it { expect(subject.add(triangle)).to eq [triangle] }
    it { expect { subject.add(1)}.to raise_error(FiguresCollection::Error, "'1' should be type of Figure") }
  end

  describe 'all' do
    subject { collection.all }

    it 'returns collection' do
      is_expected.to eq []

      collection.add square
      is_expected.to eq [square]

      collection.add triangle
      is_expected.to eq [square, triangle]
    end
  end

  describe 'max' do
    subject { collection.max }

    it 'returns max' do
      collection.add rectangle
      collection.add square
      collection.add triangle

      is_expected.to eq square
    end
  end

  describe 'min' do
    subject { collection.min }

    it 'returns min' do
      collection.add square
      collection.add triangle
      collection.add rectangle

      is_expected.to eq triangle
    end
  end

  describe 'sort' do
    subject { collection.sort }
    before do
      collection.add square
      collection.add triangle
      collection.add rectangle
    end

    it 'returns new collection' do
      is_expected.to be_an_instance_of FiguresCollection
      is_expected.not_to eq collection
    end

    it 'returns new sorted collection' do
      expect(subject.all).to eq [triangle, rectangle, square]
    end

    it 'old collection not changed' do
      expect { collection.sort }.not_to change { collection.all }
    end
  end

  describe 'sort!' do
    subject { collection.sort! }
    before do
      collection.add rectangle
      collection.add square
      collection.add triangle
    end

    it 'returns itself' do
      is_expected.to eq collection
    end

    it 'returns sorted collection' do
      subject
      expect(collection.all).to eq [triangle, rectangle, square]
    end
  end

  describe 'group by type' do
    subject { collection.group_by_type }

    before do
      collection.add triangle
      collection.add square
      collection.add triangle2
      collection.add square2
    end

    it 'returns collections' do
      expect(subject.values.all? { |x| x.is_a? FiguresCollection }).to eq true
    end

    it 'all keys is a Figure' do
      expect(subject.keys.all? { |x| x <= Figure }).to eq true
    end

    it 'values returns correct Array' do
      expect(subject[Triangle].all).to eq [triangle, triangle2]
    end
  end

  describe '#each' do
    subject { collection.each }

    before do
      collection.add triangle
      collection.add square
      collection.add rectangle
    end

    it 'each works' do
      expect { |b| collection.each(&b) }.to yield_successive_args(triangle, square, rectangle)
    end
  end

  describe '#map' do
    subject { collection.map }

    before do
      collection.add triangle
      collection.add rectangle
      collection.add square
    end

    it 'map works' do
      expect(collection.map(&:perimeter)).to match_array([24, 30, 40])
    end

    it 'map' do
      expect { |b| collection.map(&b) }.to yield_successive_args(triangle, rectangle, square)
    end
  end

  describe '#inject' do
    subject { collection.inject }

    before do
      collection.add rectangle
      collection.add square
    end

    it 'inject' do
      expect { |b| collection.inject(&b) }.to yield_successive_args(rectangle, square)
     end
  end
end
