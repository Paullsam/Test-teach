gem 'rspec', '3.7.0'
require 'rspec'
require 'pry'
require 'pry-byebug'

class Figure
  class Error < StandardError; end
  include Comparable

  def <=>(other)
    unless other.is_a? Figure
      raise Figure::Error, "`#{other.inspect}` should be type of `Figure`"
    end

    self.area <=> other.area
  end

  def perimeter
    sides.inject :+
  end

  def figure?
    false
  end
end

class Rectangle < Figure
  def initialize(side1, side2)
    @side1, @side2 = side1, side2
  end

  def area
    @side1 * @side2
  end

  def sides
    [@side1, @side1, @side2, @side2]
  end
end

class Square < Rectangle
  def initialize(side)
    @side1, @side2 = side, side
  end
end

class Triangle < Figure
  def initialize(side1:, side2: nil, side3: nil, angle1: nil, angle2: nil)
    @side1, @side2, @side3, @angle1, @angle2 = side1, side2, side3, angle1, angle2

    if @side1 && @side2 && @side3
      # find angles

    elsif @side1 && @angle1 && @angle2
      @side2 = (@side1 * Math.sin(@angle1)) / Math.sin(@angle2)
      @side3 = find_side3

    elsif @side1 && @side2 && @angle1
      @side3 = find_side3

    else
      raise Figure::Error, "Введите корректные данные"
    end

    unless 3.times.map { |i| sides.rotate(i) }.all? { |(s1, s2, s3)| s1 + s2 > s3 }
      raise Figure::Error, "Неправильный треугольник"
    end
  end

  def area
    Math.sqrt(sides.inject(p) { |result, x|  result * (p - x) })
  end

  def sides
    [@side1, @side2, @side3]
  end

  private

  def p
    @p = perimeter / 2.0
  end

  def find_side3
    Math.sqrt(@side1**2 + @side2**2 - (2 * @side1 * @side2) * Math.cos(@angle1))
  end
end

class Circle < Figure
  def initialize(radius)
    @radius = radius
  end

  def perimeter
    2.0 * Math::PI * radius
  end

  def area
    Math::PI * radius ** 2
  end
end

RSpec.describe Rectangle do
  subject { described_class.new(2, 3) }

  it { is_expected.to be_instance_of(Rectangle) }
  it { expect(subject.area).to eq 6 }
  it { expect(subject.sides).to eq [2, 2, 3, 3] }
end

RSpec.describe Square do
  subject { described_class.new(2) }

  it { is_expected.not_to be_figure }
  it { is_expected.to be_instance_of(Square) }

  it { expect(subject.area).to eq 4 }
  it { expect(subject.sides).to eq [2, 2, 2, 2] }
end

RSpec.describe Circle do
  subject { described_class.new(3) }

  #it {  }
end

RSpec.describe Triangle do
  subject { described_class.new(**args) }

  context 'when 3 sides given' do
    let(:args) { {side1: 3, side2: 4, side3: 5} }

    it { is_expected.to be_instance_of(Triangle) }
    it { expect(subject.area).to eq 6 }
    it { expect(subject.perimeter).to eq 12 }
  end

  context 'when 3 sides given' do
    let(:args) { {side1: 3, side2: 4, angle1: Math::PI/3.0} }

    it { is_expected.to be_instance_of(Triangle) }
    xit { expect(subject.area).to eq 4.5 }
    xit { expect(subject.perimeter).to eq 12 }
  end

  context 'when wrong Triangle' do
    let(:args) { {side1: 3, side2: 3, side3: 6} }

    it do
      expect { described_class.new(**args) }.
        to raise_error(Figure::Error, 'Неправильный треугольник')
    end
  end
end
