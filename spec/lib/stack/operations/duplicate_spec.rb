# frozen_string_literal: true

require "spec_helper"

RSpec.describe Stack::Duplicate do
  let(:result) { described_class[:DUP3, 3].call(stack:) }

  context "with a valid stack" do
    let(:stack) { [1, 2, 3] }

    it "duplicates the first item on the stack" do
      expect(result.fetch(:stack)).to eq [1, 2, 3, 1, 2, 3]
    end
  end

  context "with missing stack items" do
    let(:stack) { [1, 2] }

    it "raises an error" do
      expect { result.fetch(:stack) }
        .to raise_error Stack::MissingStackValues
    end
  end
end
