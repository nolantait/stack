module Stack
  class Disassemble
    class Stack
      def initialize
        @stack = []
      end

      def push(items)
      end

      def pop(n)
      end
    end

    class Instruction
      def initialize(*bytes)
        @opcode = bytes[0]
        @operands = bytes[1..-1]
        @total_bytes = bytes.size
        @operator= Opscodes["0x#{opcode}"][@operands]
      end

      def call(stack)
        @operator.call(stack, *@operands)
      end

      def print
        "#{@total_bytes}     #{Opscodes["0x#{@opcode}"].to_s} #{"  => #{@operands.join}"}"
      end
    end

    def self.call(bytecode)
      new(bytecode).call
    end

    def initialize(bytecode)
      @bytecode = bytecode
      @stack = Stack.new
    end

    def call
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
            break

          when byte.chars[0] == "6" # Then its a push bytecode that takes another byte
            yielder << [byte, byte[index + 1]]
            index += 2
            break

          else
            yielder << [byte]
            index += 1
          end
        end
      end
    end
  end
end
