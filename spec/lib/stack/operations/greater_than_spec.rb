require "spec_helper"

RSpec.describe Stack::GreaterThan do
  let(:result) { described_class[:GT, 3].call(stack: stack) }

  context "when the first item is greater than the second" do
    let(:stack) { [2,1,3] }

    it "returns 1" do
      expect(result.fetch(:stack)).to eq [1, 3]
    end
  end

  context "when the first item is less than the second" do
    let(:stack) { [1,2,3] }

    it "returns 0 when the first item on the stack is less than the second" do
      expect(result.fetch(:stack)).to eq [0, 3]
    end
  end
end
