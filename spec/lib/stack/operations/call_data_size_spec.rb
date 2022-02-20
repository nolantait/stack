# frozen_string_literal: true

require "spec_helper"

RSpec.describe Stack::CallDataSize do
  let(:result) { described_class[:CALLDATASIZE, 2].call(stack:) }

  context "with no call data" do
    let(:stack) { [] }

    it "returns 0" do
      expect(result.fetch(:stack)).to eq [0]
    end
  end
end
