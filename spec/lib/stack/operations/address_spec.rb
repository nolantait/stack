# frozen_string_literal: true

require "spec_helper"

RSpec.describe Stack::Address do
  let(:result) { described_class[:CALLER, 2].call(stack:, address:) }
  let(:stack) { [1, 2, 3] }
  let(:address) { "0xbe862ad9abfe6f22bcb087716c7d89a26051f74c" }

  it "adds the caller to the stack" do
    expect(result.fetch(:stack)).to eq [address.to_i(16), 1, 2, 3]
  end
end
