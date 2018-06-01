RSpec.describe Cube do
  subject { describe_class.new(3) }

  it { expect{subject.area}.to eq 54 }
  it { expect{subject.capacity}.to eq 27 }
end
