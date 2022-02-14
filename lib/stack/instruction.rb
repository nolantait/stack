module Stack
  class Instruction
    attr_reader :total_bytes, :operands

    def initialize(*bytes)
      @opcode = bytes[0]                # The register for the operation like ADD
      @operands = bytes[1..-1]          # The arguments for the instruction like in a PUSH op
      @total_bytes = bytes.size         # The total bytes in this instruction
      @operator= Opcodes["0x#{@opcode}"]# The operation to be performed
    end

    def call(stack)
      @operator.call(stack, *@operands)
    end

    def name
      @operator.name
    end

    def gas_cost
      @operator.gas_cost
    end
  end
end
