require "spec_helper"

RSpec.describe Stack::Not do
  let(:stack) { [18,3] }
  let(:result) { described_class[:AND, 3].call(stack: stack) }

  it "returns the result of a bitwise operation to the top of the stack" do
    expect(result.fetch(:stack)).to eq [-19, 3]
  end
end
