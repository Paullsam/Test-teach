RSpec.describe Pyramid do
  subject { described_class.new(**args) }

  context 'Пирамида с квадратным основанием' do
    let(:args) { {height: 10, base: "sQuare", side: 4} }

    it { expect(subject.area).to eq 98 }
    it { expect(subject.volume).to eq 33 }
    it { expect(subject.apothem).to eq 10 }
  end

  context 'Пирамида с треугольным основанием' do
    let(:args) { {height: 4, base: "triangle", side: 3} }

    it { expect(subject.apothem).to eq 4 }
  end

  context 'Error' do
    let(:args) { {height: 15, base: "квадрат", side: 5} }

    it { expect{ described_class.new(**args)}.to raise_error(SolidFigure::Error, 'Incorrect base type') }
  end
end
