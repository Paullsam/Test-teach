RSpec.describe FiguresCollection do
  subject { described_class.new }

  context 'Add a figure' do
    it { expect(subject.add(triangle)).to eq [triangle] }
  end
end
