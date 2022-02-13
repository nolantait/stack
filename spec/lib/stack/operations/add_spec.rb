require "spec_helper"

RSpec.describe Stack::Add do
  it "adds two numbers on the stack" do
    stack = [1, 2, 3]
    expect(described_class[:ADD, 3].call(stack)).to eq [3, 3]
  end
end
