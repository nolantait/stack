require "spec_helper"

RSpec.describe Stack::Subtract do
  let(:stack) { [2,1,3] }
  let(:result) { described_class[:SUB, 3].call(stack: stack) }

  it "subtracts two numbers on the stack" do
    expect(result.fetch(:stack)).to eq [1, 3]
  end
end
