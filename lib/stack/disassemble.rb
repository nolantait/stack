module Stack
  class Disassemble
    def self.call(bytecode)
      new(bytecode).call
    end

    def initialize(bytecode)
      @bytecode = bytecode
    end

    def call
    end
  end
end
