RSpec.describe Circle do
  subject { described_class.new(3) }

  it { expect(subject.area).to eq 28.3 }
end
