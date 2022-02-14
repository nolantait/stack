require "spec_helper"

RSpec.describe Stack::Exponent do
  let(:stack) { [2,3,3] }
  let(:result) { described_class[:EXP, 3].call(stack: stack) }

  it "exponentiates two numbers on the stack" do
    expect(result.fetch(:stack)).to eq [8, 3]
  end
end
