RSpec.describe Prism do
  subject { described_class.new(**args) }

  context 'Если куб' do
    let(:args) { {height: 10, base: 'SQUARE', side: 10} }
    it { expect(subject.base_area).to eq 100 }
    it { expect(subject.volume).to eq 1000 }
  end
end
