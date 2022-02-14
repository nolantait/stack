require "spec_helper"

RSpec.describe Stack::Multiply do
  let(:stack) { [1,2,3] }
  let(:result) { described_class[:MUL, 3].call(stack: stack) }

  it "multiplies two numbers on the stack" do
    expect(result.fetch(:stack)).to eq [2, 3]
  end
end
