require "spec_helper"

RSpec.describe Stack::Or do
  it "returns the result of a bitwise operation to the top of the stack" do
    stack = [5, 7, 3]
    expect(described_class[:OR, 3].call(stack)).to eq [7, 3]
  end
end
