require "spec_helper"

RSpec.describe Stack::Jump do
  it "jumps to a desination" do
    stack = []
    expect(described_class[:JUMP, 3].call(stack)).to eq []
  end
end
