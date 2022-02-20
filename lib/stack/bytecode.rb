# frozen_string_literal: true

module Stack
  class Bytecode
    include Enumerable

    # Enumerator for bytecode which is context aware of bytecode operations
    # like PUSH which takes more bytes as an argument

    def initialize(raw_bytecode)
      @raw_bytecode = raw_bytecode
    end

    def each
      [].tap do |parsed|
        index = 0

        while (byte = bytes[index])
          next_byte = push_opcode?(byte) ? [byte, bytes[index + 1]] : [byte]
          yield next_byte if block_given?
          parsed.push(next_byte)
          index += next_byte.size
        end
      end
    end

    private

    def push_opcode?(byte)
      puts byte
      byte[0] == "6"
    end

    def bytes
      @raw_bytecode.chars.each_slice(2).map(&:join)
    end
  end
end
