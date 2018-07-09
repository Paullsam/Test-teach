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

=begin
  describe 'sorted_collection' do
    subject { collection.sorted_collection }

    it 'sort collection' do
      collection.add square
      collection.add triangle
      collection.add rectangle

      is_expected.to eq [triangle, rectangle, square]
    end
  end
=end

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

    it 'returns new sorted collection' do
      collection.add square
      collection.add triangle
      collection.add rectangle

      is_expected.to eq [triangle, rectangle, square]
    end
  end

  describe 'sort!' do
    subject { collection.sort! }

    it 'returns sorted collection' do
      collection.add rectangle
      collection.add square
      collection.add triangle

      is_expected.to eq [triangle, rectangle, square]
    end
  end

  describe 'group by type' do
    subject { collection.group_by_type }

    it 'returns group' do
      collection.add rectangle
      collection.add triangle
      collection.add square
      collection.add rectangle2
      collection.add triangle2
      collection.add square2

      is_expected.to eq Rectangle => [rectangle, rectangle2], Triangle => [triangle, triangle2], Square => [square, square2]
    end
  end
end
