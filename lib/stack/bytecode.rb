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
          next_byte = handle_byte(byte, index)
          yield next_byte if block_given?
          parsed.push(next_byte)
          index += next_byte.size
        end
      end
    end

    private

    def handle_byte(byte, index)
      push_opcode?(byte) ? fetch_push_bytes(byte, index) : [byte]
    end

    def fetch_push_bytes(byte, index)
      offset = index + ("0x#{byte}".to_i(16) - 95)
      arguments = bytes[(index + 1)..offset]
      [byte, arguments].flatten
    end

    def push_opcode?(byte)
      %w[6 7].include? byte[0]
    end

    def bytes
      @raw_bytecode.upcase.chars.each_slice(2).map(&:join)
    end
  end
end
