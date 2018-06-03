RSpec.xdescribe Pyramid do
  subject { describe_class.new(**args) }

  context 'Пирамида с квадратным основанием' do
    let(:args) { {height: 10, base: sqUare, side: 4} }

    it { expect(subject.area).to eq 98 }
    it { expect(subject.volume).to eq 53.3333 }
  end

  context 'Пирамида с треугольным основанием' do
    let(:args) { {height: 4, base: triangle, side: 3} }

    it { expect(subject.apothem).to eq 5 }
  end

  context 'Error' do
    let(:args) { {height: 15, base: квадрат, side: 5} }

    it { expect{ describe_class.new(**args)}.to raise_error(Figure::Error, 'Введите тип основания') }
  end

  context 'Конус' do
    let(:args) { {height: 8, base: cirle, raduis: 3} }

    it { expect(subject.m_radius).to eq 3 }
  end
end
