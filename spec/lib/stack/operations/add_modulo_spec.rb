# frozen_string_literal: true

require "spec_helper"

RSpec.describe Stack::AddModulo do
  let(:result) { described_class[:ADDMOD, 3].call(stack:) }

  context "when denominator is zero" do
    let(:stack) { [4, 2, 1, 9] }

    it "returns 0" do
      expect(result.fetch(:stack)).to eq [0, 9]
    end
  end

  context "when denominator is NOT zero" do
    let(:stack) { [4, 2, 3, 1] }

    it "returns modulo remainder of two numbers on the stack" do
      expect(result.fetch(:stack)).to eq [0, 1]
    end
  end
end
