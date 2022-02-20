# frozen_string_literal: true

require "spec_helper"

RSpec.describe Stack::Divide do
  let(:result) { described_class[:DIV, 3].call(stack:) }

  context "when the denominator is 0" do
    let(:stack) { [4, 0, 3] }

    it "returns 0 when denominator is zero" do
      expect(result.fetch(:stack)).to eq [0, 3]
    end
  end

  context "when the denominator is NOT 0" do
    let(:stack) { [4, 2, 3] }

    it "divides two numbers on the stack" do
      expect(result.fetch(:stack)).to eq [2, 3]
    end
  end
end
