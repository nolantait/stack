require "spec_helper"

RSpec.describe Stack::MultiplyModulo do
  let(:result) { described_class[:MULMOD, 3].call(stack: stack) }

  context "when the denominator is 0" do
    let(:stack) { [3,2,3,1] }

    it "returns modulo of two multiplied numbers on the stack" do
      expect(result.fetch(:stack)).to eq [0, 1]
    end
  end

  context "when the denominator is 0" do
    let(:stack) { [4,2,0,9] }

    it "returns 0 when denominator is zero" do
      expect(result.fetch(:stack)).to eq [0, 9]
    end
  end
end
