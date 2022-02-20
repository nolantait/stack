# frozen_string_literal: true

module Stack
  class Runtime
    OutOfGas = Class.new(StandardError)
    StackOverflow = Class.new(StandardError)

    MAX_STACK_DEPTH = 1024

    attr_reader :counter, :gas, :stack, :history, :context

    def initialize(gas = 1000000000)
      @stack = []
      @counter = 0
      @gas = gas
      @history = {}

      # Stubbed for now. Context is data that is never modified.
      # Context is generated from the contract call
      @context = {
        data: [],
        caller: "0xbe862ad9abfe6f22bcb087716c7d89a26051f74c"
      }
    end

    def call(instruction)
      @history[@counter] = instruction

      new_stack, new_counter, new_gas =
        instruction.call(stack:, counter:, gas:, **@context)

      fail StackOverflow if new_stack.size > MAX_STACK_DEPTH
      fail OutOfGas if new_gas.negative?

      @stack = new_stack
      @counter = new_counter
      @gas = new_gas
    rescue ExecutionStopped
      self
    end
  end
end
