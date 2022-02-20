# frozen_string_literal: true

require "spec_helper"

RSpec.describe Stack::IsZero do
  let(:result) { described_class[:ISZERO, 3].call(stack:) }

  context "when the first item on the stack is 0" do
    let(:stack) { [0, 3] }

    it "returns 1" do
      expect(result.fetch(:stack)).to eq [1, 3]
    end
  end

  context "when the first item on the stack is NOT 0" do
    let(:stack) { [1, 3] }

    it "returns 0" do
      expect(result.fetch(:stack)).to eq [0, 3]
    end
  end
end
