# frozen_string_literal: true

require "spec_helper"

RSpec.describe Stack::ConditionalJump do
  let(:result) { described_class[:JUMPI, 10].call(stack:, counter:) }

  context "with a true condition" do
    let(:stack) { [3, 1] }
    let(:counter) { 1 }

    it "removes two items from the stack" do
      expect(result.fetch(:stack)).to eq []
    end

    it "sets the counter to the destination" do
      expect(result.fetch(:counter)).to eq 3
    end
  end

  context "with a false condtion" do
    let(:stack) { [3, 0] }
    let(:counter) { 1 }

    it "removes two items from the stack" do
      expect(result.fetch(:stack)).to eq []
    end

    it "increments the counter by 1" do
      expect(result.fetch(:counter)).to eq 2
    end
  end
end
