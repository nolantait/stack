require "spec_helper"

RSpec.describe Stack::Push do
  it "adds bytes to the stack" do
    stack = []
    expect(described_class[:PUSH, 3].call(stack, 1, 2)).to eq [1, 2]
  end
end
