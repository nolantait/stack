module Stack
  class Runtime
    OutOfGas = Class.new(StandardError)
    StackOverflow = Class.new(StandardError)

    MAX_STACK_DEPTH = 1024.freeze

    attr_reader :counter, :gas, :stack, :history

    def initialize(gas = 1000000000)
      @stack = []
      @counter = 0
      @gas = gas
      @history = {}
    end

    def call(instruction)
      @history[@counter] = instruction

      stack, counter, gas = instruction.call(
        stack: @stack,
        counter: @counter,
        gas: @gas
      )

      raise StackOverflow if stack.size > MAX_STACK_DEPTH
      raise OutOfGas if gas < 0

      @stack = stack
      @counter = counter
      @gas = gas

    rescue ExecutionStopped
      return self
    end
  end
end
