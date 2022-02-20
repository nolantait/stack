# frozen_string_literal: true

require "spec_helper"

RSpec.describe Stack::JumpDestination do
  let(:result) { described_class[:JUMPDEST, 3].call }

  it "does nothing to the stack, acts as a placeholder for JUMP and JUMPI" do
    expect(result).to eq({})
  end
end
