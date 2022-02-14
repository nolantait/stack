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
      @bytecode = bytecode
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
      bytecode_enumerator.map do |bytes|
        Instruction.new(*bytes)
      end
    end

    def bytes
      @bytecode.chars.each_slice(2).map(&:join)
    end

    def bytecode_enumerator
      Enumerator.new do |yielder|
        index = 0
        more_bytes = true

        while more_bytes
          byte = bytes[index]

          case
          when byte.nil? # We have parsed all the bytecode
            more_bytes = false
          when byte.chars[0] == "6" # Then its a push bytecode that takes another byte
            yielder << [byte, bytes[index + 1]]
            index += 2
          else
            yielder << byte
            index += 1
          end
        end
      end
    end
  end
end
