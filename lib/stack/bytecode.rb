# frozen_string_literal: true

module Stack
  class Bytecode
    include Enumerable

    # Enumerator for bytecode which is context aware of bytecode operations.
    # e.g. PUSH which takes more bytes as an argument.
    # No other opcodes take any arguments.
    #
    # Bytecode looks like 6040604001 which this class then break apart into
    # individual bytecode operations which would look like:
    # [%w[60 40], %w[60 40], 01] which we can later translate to EVM mneumonics:
    #
    # PUSH1 0x40
    # PUSH1 0x40
    # ADD
    #
    # This class includes Enumerable which means you can use it as an enumerator
    # with .each and related methods.

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

    # %w is shorthand for a normal array without the ","s
    # [60, 40, 60, 40, 01] => [%w[60 40], %w[60 40], 01]
    def handle_byte(byte, index)
      push_opcode?(byte) ? fetch_push_bytes(byte, index) : [byte]
    end

    # PUSH1 through PUSH32 take a variable number of arguments which we find
    # by subtracting the index of the first PUSH1 which is 0x60 or 95 after
    # converting to normal integers
    def fetch_push_bytes(byte, index)
      offset = index + ("0x#{byte}".to_i(16) - 95)
      arguments = bytes[(index + 1)..offset]
      [byte, arguments].flatten
    end

    def push_opcode?(byte)
      %w[6 7].include? byte[0]
    end

    # 6040604001 => [60, 40, 60, 40, 01]
    def bytes
      @raw_bytecode.upcase.chars.each_slice(2).map(&:join)
    end
  end
end
