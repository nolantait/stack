# frozen_string_literal: true

require "spec_helper"

RSpec.describe Stack::CallDataSize do
  let(:result) { described_class[:CALLDATASIZE, 2].call(stack:, data:) }

  context "with no call data" do
    let(:stack) { [] }
    let(:data) { [] }

    it "returns 0" do
      expect(result.fetch(:stack)).to eq [0]
    end
  end

  context "with call data" do
    let(:stack) { [] }
    let(:data) { [1, 2, 3] }

    it "adds the data size to the stack" do
      expect(result.fetch(:stack)).to eq [3]
    end
  end
end
