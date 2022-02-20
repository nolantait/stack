# frozen_string_literal: true

require "spec_helper"

RSpec.describe Stack::CallDataLoad do
  let(:result) { described_class[:CALLDATALOAD, 3].call(stack:, data:) }

  context "with no call_data" do
    let(:stack) { [0, 1, 2] }
    let(:data) { [] }

    it "removes an item from the stack" do
      expect(result.fetch(:stack)).to eq [1, 2]
    end
  end

  context "with call data" do
    let(:stack) { [0, 1, 2] }
    let(:data) { [255, 255, 255] }

    it "adds the call data to the stack" do
      expect(result.fetch(:stack)).to eq [255, 255, 255, 1, 2]
    end
  end
end
