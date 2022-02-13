module Stack
  class Instruction
    attr_reader :total_bytes, :operands

    def initialize(*bytes)
      @opcode = bytes[0]
      @operands = bytes[1..-1]
      @total_bytes = bytes.size
      @operator= Opcodes["0x#{@opcode}"]
    end

    def call(stack)
      @operator.call(stack, *@operands)
    end

    def name
      @operator.name
    end
  end
end
