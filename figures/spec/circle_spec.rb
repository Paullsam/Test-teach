RSpec.describe Circle do
  subject { described_class.new(3) }

  it { expect(subject.area).to eq Math::PI * 3 ** 2 }
end
