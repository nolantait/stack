# frozen_string_literal: true

require "spec_helper"

RSpec.describe Stack::Modulo do
  let(:result) { described_class[:DIV, 3].call(stack:) }

  context "when the denominator is NOT zero" do
    let(:stack) { [4, 2, 3] }

    it "returns modulo remainder of two numbers on the stack" do
      expect(result.fetch(:stack)).to eq [0, 3]
    end
  end

  context "when the denominator is zero" do
    let(:stack) { [4, 0, 3] }

    it "returns 0" do
      expect(result.fetch(:stack)).to eq [0, 3]
    end
  end
end
