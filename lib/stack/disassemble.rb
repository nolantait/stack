# frozen_string_literal: true

module Stack
  class Disassemble
    Format = lambda do |instruction, byte_index|
      formatted_bytes = [byte_index, "      ", instruction.name].tap do |output|
        output.concat(["  => ", instruction.operands.join(", ")]) if instruction.total_bytes > 1
      end

      formatted_bytes.join
    end

    def self.call(bytecode)
      new(bytecode).call
    end

    def initialize(bytecode)
      @bytecode = Stack::Bytecode.new(bytecode)
    end

    def call
      byte_index = 0

      formatted_instructions = instructions.map do |instruction|
        Format.call(instruction, byte_index).tap do |_result|
          byte_index += instruction.total_bytes
        end
      end

      formatted_instructions.join("\n")
    end

    private

    def instructions
      @bytecode.map do |bytes|
        Instruction.new(*bytes)
      end
    end
  end
end
