# frozen_string_literal: true

require "spec_helper"

RSpec.describe Stack::Balance do
  let(:result) { described_class[:BALANCE, 100].call(stack:, access_sets:) }
  let(:access_sets) do
    {
      "0xbe862ad9abfe6f22bcb087716c7d89a26051f74c" => {
        balance: 1
      }
    }
  end

  context "with a valid stack" do
    let(:stack) { ["0xbe862ad9abfe6f22bcb087716c7d89a26051f74c".to_i(16)] }

    it "adds two numbers on the stack" do
      expect(result.fetch(:stack)).to eq [1]
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
