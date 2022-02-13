require "spec_helper"

RSpec.describe Stack::Not do
  it "returns the result of a bitwise operation to the top of the stack" do
    stack = [18, 3]
    expect(described_class[:AND, 3].call(stack)).to eq [-19, 3]
  end
end
