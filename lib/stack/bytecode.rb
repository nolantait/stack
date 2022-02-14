module Stack
  class Bytecode
    include Enumerable

    # Enumerator for bytecode which is context aware of bytecode operations
    # like PUSH which takes more bytes as an argument

    def initialize(raw_bytecode)
      @raw_bytecode = raw_bytecode
    end

    def each(&block)
      index = 0
      more_bytes = true

      while more_bytes
        byte = bytes[index]

        if byte.nil?
          more_bytes = false
          next
        end

        if push_opcode?(byte)
          block.call [byte, bytes[index + 1]]
          index += 2
        else
          block.call byte
          index += 1
        end
      end
    end

    private

    def push_opcode?(byte)
      byte.chars[0] == "6"
    end

    def bytes
      @raw_bytecode.chars.each_slice(2).map(&:join)
    end
  end
end
