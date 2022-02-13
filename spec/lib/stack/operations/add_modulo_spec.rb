require "spec_helper"

RSpec.describe Stack::AddModulo do
  it "returns modulo remainder of two numbers on the stack" do
    stack = [4, 2, 3, 1]
    expect(described_class[:ADD_MOD, 3].call(stack)).to eq [0, 1]
  end

  it "returns 0 when denominator is zero" do
    stack = [4, 2, 1, 9]
    expect(described_class[:DIV, 3].call(stack)).to eq [0, 9]
  end
end
