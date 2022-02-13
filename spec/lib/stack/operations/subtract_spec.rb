require "spec_helper"

RSpec.describe Stack::Subtract do
  it "subtracts two numbers on the stack" do
    stack = [2, 1, 3]
    expect(described_class[:SUB, 3].call(stack)).to eq [1, 3]
  end
end
