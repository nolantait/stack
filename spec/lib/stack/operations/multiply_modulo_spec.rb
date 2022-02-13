require "spec_helper"

RSpec.describe Stack::MultiplyModulo do
  it "returns modulo of two multiplied numbers on the stack" do
    stack = [3, 2, 3, 1]
    expect(described_class[:MUL_MOD, 3].call(stack)).to eq [0, 1]
  end

  it "returns 0 when denominator is zero" do
    stack = [4, 2, 0, 9]
    expect(described_class[:MUL_MOD, 3].call(stack)).to eq [0, 9]
  end
end
