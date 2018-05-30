RSpec.describe Square do
  subject { described_class.new(2) }

  it { is_expected.not_to be_figure }
  it { is_expected.to be_instance_of(Square) }

  it { expect(subject.area).to eq 4 }
  it { expect(subject.sides).to eq [2, 2, 2, 2] }
end
