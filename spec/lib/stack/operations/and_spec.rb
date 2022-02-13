require "spec_helper"

RSpec.describe Stack::And do
  it "returns the result of a bitwise operation to the top of the stack" do
    stack = [7, 5, 3]
    expect(described_class[:AND, 3].call(stack)).to eq [5, 3]
  end
end
