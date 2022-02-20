# frozen_string_literal: true

require "spec_helper"

RSpec.describe Stack::Pop do
  let(:result) { described_class[:POP, 2].call(stack:) }

  context "with a valid stack" do
    let(:stack) { [1] }

    it "adds two numbers on the stack" do
      expect(result.fetch(:stack)).to eq []
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
