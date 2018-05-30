RSpec.describe Rectangle do
  subject { described_class.new(2, 3) }

  it { is_expected.to be_instance_of(Rectangle) }
  it { expect(subject.area).to eq 6 }
  it { expect(subject.sides).to eq [2, 2, 3, 3] }
end
