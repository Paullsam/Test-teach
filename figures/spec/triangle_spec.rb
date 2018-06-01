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

    it { expect{ described_class.new(**args) }.to raise_error(Figure::Error, 'Неправильный треугольник') }
  end
end
