RSpec.describe Pyramid do
  subject { described_class.new(**args) }

  context 'Пирамида с квадратным основанием' do
    let(:args) { {height: 10, base: "sQuare", side: 4} }

    xit { expect(subject.area).to eq 98 }
    xit { expect(subject.volume).to eq 33 }
    xit { expect(subject.apothem).to eq 10 }
  end

  context 'Пирамида с треугольным основанием' do
    let(:args) { {height: 4, base: "triangle", side: 3} }

    xit { expect(subject.apothem).to eq 4 }
  end

  context 'Error' do
    let(:args) { {height: 15, base: "квадрат", side: 5} }

    it { expect { subject.area }.to raise_error(SolidFigure::Error, 'Incorrect base type') }
  end
end
