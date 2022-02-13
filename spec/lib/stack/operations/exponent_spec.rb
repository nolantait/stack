require "spec_helper"

RSpec.describe Stack::Exponent do
  it "exponentiates two numbers on the stack" do
    stack = [2, 3, 3]
    expect(described_class[:EXP, 3].call(stack)).to eq [8, 3]
  end
end
