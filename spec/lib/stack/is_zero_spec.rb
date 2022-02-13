require "spec_helper"

RSpec.describe Stack::IsZero do
  it "returns 1 when the first item on the stack is zero" do
    stack = [0, 3]
    expect(described_class[:ISZERO, 3].call(stack)).to eq [1, 3]
  end

  it "returns 0 when the first item on the stack is not zero" do
    stack = [1, 3]
    expect(described_class[:ISZERO, 3].call(stack)).to eq [0, 3]
  end
end
