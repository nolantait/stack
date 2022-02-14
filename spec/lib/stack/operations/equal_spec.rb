require "spec_helper"

RSpec.describe Stack::Equal do
  let(:result) { described_class[:EQ, 3].call(stack: stack) }

  context "When the first item on the stack equals the second" do
    let(:stack) { [1,1,3] }

    it "returns 1 when the first item on the stack equals the second" do
      stack = [1, 1, 3]
      expect(result.fetch(:stack)).to eq [1, 3]
    end
  end

  context "When the first item on the stack DOES NOT equal the second" do
    let(:stack) { [1,2,3] }

    it "returns 0 when the first item on the stack does not equal the second" do
      expect(result.fetch(:stack)).to eq [0, 3]
    end
  end
end
