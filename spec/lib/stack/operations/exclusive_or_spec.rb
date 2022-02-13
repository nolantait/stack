require "spec_helper"

RSpec.describe Stack::ExclusiveOr do
  it "returns the result of XOR bitwise operation to the top of the stack" do
    stack = [12, 14, 3]
    expect(described_class[:XOR, 3].call(stack)).to eq [2, 3]
  end
end
