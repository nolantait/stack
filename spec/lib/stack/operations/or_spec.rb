# frozen_string_literal: true

require "spec_helper"

RSpec.describe Stack::Or do
  let(:stack) { [5, 7, 3] }
  let(:result) { described_class[:OR, 3].call(stack:) }

  it "returns the result of a bitwise operation to the top of the stack" do
    expect(result.fetch(:stack)).to eq [7, 3]
  end
end
