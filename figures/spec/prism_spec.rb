
RSpec.describe Prism do
  subject { described_class.new(**args) }

  context 'Если куб' do
    let(:args) { {height: 10, base: 'SQUARE', side: 10} }
    xit { expect(subject.area).to eq 1000 }
    it { expect(subject.volume).to eq 1000 }
  end
end
