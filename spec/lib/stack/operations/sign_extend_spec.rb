# frozen_string_literal: true

require "spec_helper"

RSpec.describe Stack::SignExtend do
  let(:stack) { [1, 2, 3] }
  let(:result) { described_class[:SIGNEXTEND, 3].call(stack:) }

  it "does something I'm sure I'll figure out in time" do
    expect(result.fetch(:stack)).to eq(
      [
        115792089237316195423570985008687907853269984665640564039457584007913129639950,
        3
      ]
    )
  end
end
