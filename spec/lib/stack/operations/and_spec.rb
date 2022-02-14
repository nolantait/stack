require "spec_helper"

RSpec.describe Stack::And do
  let(:stack) { [7,5,3] }
  let(:result) { described_class[:AND, 3].call(stack: stack) }

  it "returns the result of a bitwise operation to the top of the stack" do
    expect(result.fetch(:stack)).to eq [5, 3]
  end
end
