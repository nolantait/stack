require "spec_helper"

RSpec.describe Stack::Multiply do
  it "multiplies two numbers on the stack" do
    stack = [1, 2, 3]
    expect(described_class[:MUL, 3].call(stack)).to eq [2, 3]
  end
end
