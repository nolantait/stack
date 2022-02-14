module Stack
  class Runtime
    OutOfGas = Class.new(StandardError)
    StackOverflow = Class.new(StandardError)

    MAX_STACK_DEPTH = 1024.freeze

    attr_reader :counter, :gas, :stack

    def initialize(gas = 1000000000)
      @stack = []
      @counter = 0
      @gas = gas
      @context = {}
    end

    def call(instruction)
      @context[@counter] = instruction

      @gas -= instruction.gas_cost
      raise OutOfGas if @gas < 0

      @stack = instruction.call(@stack).tap do |stack|
        raise StackOverflow if stack.size > MAX_STACK_DEPTH
      end

      @counter += instruction.total_bytes
    end
  end
end
