require "spec_helper"

RSpec.describe Stack::ExclusiveOr do
  let(:stack) { [12,14,3] }
  let(:result) { described_class[:XOR, 3].call(stack: stack) }

  it "returns the result of XOR bitwise operation to the top of the stack" do
    expect(result.fetch(:stack)).to eq [2, 3]
  end
end
