require "spec_helper"

RSpec.describe Stack::Divide do
  it "divides two numbers on the stack" do
    stack = [4, 2, 3]
    expect(described_class[:DIV, 3].call(stack)).to eq [2, 3]
  end

  it "returns 0 when denominator is zero" do
    stack = [4, 0, 3]
    expect(described_class[:DIV, 3].call(stack)).to eq [0, 3]
  end
end
