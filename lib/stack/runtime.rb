# frozen_string_literal: true

module Stack
  class Runtime
    OutOfGas = Class.new(StandardError)
    StackOverflow = Class.new(StandardError)

    MAX_STACK_DEPTH = 1024

    attr_reader :counter, :gas, :stack, :history

    def initialize(gas = 1000000000)
      @stack = []
      @counter = 0
      @gas = gas
      @history = {}
    end

    def call(instruction)
      @history[@counter] = instruction

      new_stack, new_counter, new_gas = instruction.call(stack:, counter:, gas:)

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
