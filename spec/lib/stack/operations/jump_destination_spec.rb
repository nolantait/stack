require "spec_helper"

RSpec.describe Stack::JumpDestination do
  it "does nothing to the stack, acts as a placeholder for JUMP and JUMPI" do
    stack = []
    expect(described_class[:ADD, 3].call(stack)).to eq []
  end
end
