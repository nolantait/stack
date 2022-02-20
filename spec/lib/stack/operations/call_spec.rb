# frozen_string_literal: true

require "spec_helper"

RSpec.describe Stack::Call do
  let(:result) { described_class[:CALL, 100].call(stack:) }
  let(:contract_address) { "3fa89944e11022fc67d12a9d2bf35ebe1164f7ef".to_i(16) }
  let(:gas) { 0xffff }

  context "with basic parameters" do
    let(:stack) { [gas, contract_address, 0, 0, 0, 0, 0] }

    it "pops parameters off the stack and returns 1" do
      expect(result.fetch(:stack)).to eq [1]
    end
  end

  context "with missing stack items" do
    let(:stack) { [] }

    it "raises an error" do
      expect { result.fetch(:stack) }
        .to raise_error Stack::MissingStackValues
    end
  end
end
