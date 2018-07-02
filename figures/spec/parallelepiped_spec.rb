RSpec.describe Parallelepiped do
  subject { described_class.new(*args) }

  context 'Если куб' do
    let(:args) { [4, 4, 4] }
    it { expect(subject.area).to eq 96 }
    it { expect(subject.volume).to eq 64 }
  end

  context 'Если прямой параллелепипед' do
    let(:args) { [3, 3, 6] }
    it { expect(subject.area).to eq 90 }
    it { expect(subject.volume).to eq 54 }
  end
end
