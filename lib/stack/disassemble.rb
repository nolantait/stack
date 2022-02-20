# frozen_string_literal: true

module Stack
  class Disassemble
    SPACING = " " * 5
    DELIMITER = "  => "

    Format = lambda do |instruction, byte_index|
      formatted_bytes = [byte_index, SPACING, instruction.name].tap do |output|
        if instruction.total_bytes > 1
          output.concat(
            [DELIMITER, instruction.operands.join(", ")]
          )
        end
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
