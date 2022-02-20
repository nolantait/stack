# frozen_string_literal: true

RSpec.describe Stack::Disassemble do
  describe ".call" do
    it "disassembles the bytecode into the expected trace" do
      bytecode = "6005600401"
      expected_stacktrace =
        "0      PUSH1  => 05\n" \
        "2      PUSH1  => 04\n" \
        "4      ADD"

      expect(Stack.disassemble(bytecode)).to eq(expected_stacktrace)
    end
  end
end
