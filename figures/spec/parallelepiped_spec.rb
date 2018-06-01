RSec.describe Parallelepiped do
  subject { describe_class.new(**args) }

  context 'Если куб'
    let(:args) {side1: 4, side2: 4, height: 4}
    it { expect{subject.area}.to eq 96 }
    it { expect{subject.capacity}.to eq 64 }
  end

  context 'Если прямой параллелепипед'
    let(:args) {side1: 3, side2: 3, height: 6}
    it { expect{subject.area}.to eq 90 }
    it { expect{subject.capacity}.to eq 54 }
  end
end
