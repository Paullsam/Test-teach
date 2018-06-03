RSpec.describe Cube do
  subject { described_class.new(3) }

  it { expect(subject.area).to eq 54 }
  it { expect(subject.volume).to eq 27 }
  it { expect(subject <=> described_class.new(5)).to eq -1 }
end
