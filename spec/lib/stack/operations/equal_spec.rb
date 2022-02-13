require "spec_helper"

RSpec.describe Stack::Equal do
  it "returns 1 when the first item on the stack equals the second" do
    stack = [1, 1, 3]
    expect(described_class[:EQ, 3].call(stack)).to eq [1, 3]
  end

  it "returns 0 when the first item on the stack does not equal the second" do
    stack = [1, 2, 3]
    expect(described_class[:EQ, 3].call(stack)).to eq [0, 3]
  end
end
