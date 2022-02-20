# frozen_string_literal: true

require "spec_helper"

RSpec.describe Stack::Add do
  let(:result) { described_class[:ADD, 3].call(stack:) }

  context "with a valid stack" do
    let(:stack) { [1, 2, 3] }

    it "adds two numbers on the stack" do
      expect(result.fetch(:stack)).to eq [3, 3]
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
