module Stack
  class Disassemble

    Format = lambda do |instruction, byte_index|
      [byte_index, "      ", instruction.name].tap do |output|
        output.concat(["  => ", instruction.operands.join(", ")]) if instruction.total_bytes > 1
      end.join
    end

    def self.call(bytecode)
      new(bytecode).call
    end

    def initialize(bytecode)
      @bytecode = Stack::Bytecode.new(bytecode)
    end

    def call
      byte_index = 0

      instructions.map do |instruction|
        Format.call(instruction, byte_index).tap do |result|
          byte_index += instruction.total_bytes
        end
      end.join("\n")
    end

    private

    def instructions
      @bytecode.map do |bytes|
        Instruction.new(*bytes)
      end
    end
  end
end
