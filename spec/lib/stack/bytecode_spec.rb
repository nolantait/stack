# frozen_string_literal: true

require "spec_helper"

RSpec.describe Stack::Bytecode do
  describe "#each" do
    it "returns the expected items" do
      bytes = "606060405236"
      bytecode = described_class.new(bytes)
      expect(bytecode.each.to_a).to eq [%w[60 60], %w[60 40], %w[52], %w[36]]
    end
  end
end
