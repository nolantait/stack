require "spec_helper"

RSpec.describe Stack::Divide do
  it "divides two numbers on the stack" do
    stack = [4, 2, 3]
    expect(described_class[:DIV, 3].call(stack)).to eq [2, 3]
  end
end
