module Stack
  class Instruction
    include Dry::Equalizer(:opcode, :operands)

    attr_reader :opcode, :total_bytes, :operands

    def initialize(*bytes)
      @opcode = bytes[0]                # The register for the operation like ADD
      @operands = bytes[1..-1]          # The arguments for the instruction like in a PUSH op
      @total_bytes = bytes.size         # The total bytes in this instruction
      @operator= Opcodes["0x#{@opcode}"]# The operation to be performed
    end

    # Call is written this way to allow easier writing of opcode functions.
    # Default values allow operations to omit return values if they do not
    # modify them.
    def call(stack:, counter:, gas:)
      @operator.call(
        stack: stack,
        counter: counter,
        gas: gas,
        operands: @operands
      ).tap do |return_values|
        stack = return_values.fetch(:stack, stack)
        counter = return_values.fetch(:counter, counter + @total_bytes)
        gas = return_values.fetch(:gas, gas - @operator.gas_cost)
      end

      return stack, counter, gas
    end

    def name
      @operator.name
    end

    def gas_cost
      @operator.gas_cost
    end
  end
end
