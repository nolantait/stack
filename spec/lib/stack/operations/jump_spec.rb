# frozen_string_literal: true

require "spec_helper"

RSpec.describe Stack::Jump do
  let(:stack) { [2] }
  let(:result) { described_class[:JUMP, 3].call(stack:, counter: 0) }

  it "returns the popped stack" do
    expect(result.fetch(:stack)).to eq []
  end

  it "sets the counter to the top of the stack" do
    expect(result.fetch(:counter)).to eq 2
  end
end
