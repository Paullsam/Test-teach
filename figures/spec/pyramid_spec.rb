Rcpec.describe Pyramid do
  subject { describe_class.new(**args) }

  contex 'Пирамида с квадратным основанием'
    let(:args) { {height: 10, base: sqUare, side: 4} }

    it { expect(subject.area).to eq 98 }
    it { expect(subject.volume).to eq 53.3333 }
  end
end
