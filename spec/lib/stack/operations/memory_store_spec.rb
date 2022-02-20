# frozen_string_literal: true

require "spec_helper"

RSpec.describe Stack::MemoryStore do
  it "stores an item in memory" do
    stack = [4, 5]
    result = described_class[:MSTORE, 3].call(stack:, memory: {})
    expect(result.fetch(:memory)).to eq(
      {
        4 => 5
      }
    )
  end
end
