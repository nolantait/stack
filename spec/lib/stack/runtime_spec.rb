require "spec_helper"

RSpec.describe Stack::Runtime do
  describe "#call" do
    it "raises an error when out of gas" do
      runtime = described_class.new(0)
      instruction = Stack::Instruction.new(60, 04)

      expect{ runtime.call(instruction) }.to raise_error Stack::Runtime::OutOfGas
    end

    it "raises an overflow error when stack exceeds 1024 items" do
      runtime = described_class.new
      instructions = (1..1025).to_a.map do |n|
        Stack::Instruction.new(60, n)
      end

      expect{ instructions.each { |i| runtime.call(i) } }
        .to raise_error Stack::Runtime::StackOverflow
    end

    it "increments the counter by the bytes of each instruction" do
      runtime = described_class.new
      instruction = Stack::Instruction.new(60, 04)
      runtime.call(instruction)

      expect(runtime.counter).to eq 2
    end

    it "adds executed instructions to the context" do
      runtime = described_class.new
      instruction = Stack::Instruction.new(60, 04)
      runtime.call(instruction)

      expect(runtime.history).to eq({ 0 => Stack::Instruction.new(60, 04) })
    end
  end
end
