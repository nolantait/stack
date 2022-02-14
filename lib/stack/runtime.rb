module Stack
  class Runtime
    OutOfGas = Class.new(StandardError)
    StackOverflow = Class.new(StandardError)

    MAX_STACK_DEPTH = 1024.freeze

    attr_reader :counter, :gas, :stack, :context

    def initialize(gas = 1000000000)
      @stack = []
      @counter = 0
      @gas = gas
      @context = {}
    end

    def call(instruction)
      @context[@counter] = instruction
      handle_gas_costs(instruction)
      update_stack(instruction)
      @counter += instruction.total_bytes
    end

    private

    def update_stack(instruction)
      @stack = instruction.call(@stack).tap do |stack|
        raise StackOverflow if stack.size > MAX_STACK_DEPTH
      end
    end

    def handle_gas_costs(instruction)
      @gas -= instruction.gas_cost
      raise OutOfGas if @gas < 0
    end
  end
end
