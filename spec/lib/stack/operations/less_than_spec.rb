require "spec_helper"

RSpec.describe Stack::LessThan do
  it "returns 1 when the first item on the stack is less than the second" do
    stack = [2, 1, 3]
    expect(described_class[:LT, 3].call(stack)).to eq [0, 3]
  end

  it "returns 0 when the first item on the stack is greater than the second" do
    stack = [1, 2, 3]
    expect(described_class[:LT, 3].call(stack)).to eq [1, 3]
  end
end
