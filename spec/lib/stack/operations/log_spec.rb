# frozen_string_literal: true

require "spec_helper"

RSpec.describe Stack::Log do
  let(:result) { described_class[:LOG1, 3].call(stack:, memory:) }
  let(:memory) do
    {
      0 => 4,
      1 => 8
    }
  end

  context "with a valid stack" do
    let(:stack) { [0, 32, 3] }

    it "removes items from the stack" do
      expect(result.fetch(:stack)).to eq []
    end

    it "adds logs to the runtime" do
      expect(result.fetch(:logs)).to eq [{topics: [3], data: [4, 8]}]
    end
  end

  context "with missing stack items" do
    let(:stack) { [] }

    it "raises an error" do
      expect { result.fetch(:stack) }
        .to raise_error Stack::MissingStackValues
    end
  end
end
