Rcpec.describe Pyramid do
  subject { describe_class.new(**args) }

  contex 'Пирамида с квадратным основанием'
    let(:args) { {height: 10, base: sqUare, side: 4} }

    it { expect(subject.area).to eq 98 }
    it { expect(subject.volume).to eq 53.3333 }
  end

  contex 'Пирамида с треугольным основанием'
    let(:args) { {height: 4, base: triangle, side: 3} }

    it { expect(subject.apothem).to eq 5 }
  end

  contex "Error"
    let(:args) { {height: 15, base: квадрат, side: 5} }

    it { expect{ describe_class.new(**args)}.to raise_error(Figure::Error, 'Введите тип основания') }
  end
end
