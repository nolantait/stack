# frozen_string_literal: true

require "spec_helper"

RSpec.describe Stack::Push do
  let(:stack) { [] }
  let(:result) { described_class[:PUSH, 3].call(stack:, operands: [1, 2]) }

  it "adds bytes to the stack" do
    expect(result.fetch(:stack)).to eq [1, 2]
  end
end
