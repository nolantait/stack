# frozen_string_literal: true

module Stack
  class Runtime
    OutOfGas = Class.new(StandardError)
    StackOverflow = Class.new(StandardError)

    MAX_STACK_DEPTH = 1024

    attr_reader :counter, :gas, :stack, :memory, :history, :context

    def initialize(gas = 1000000000)
      @stack = []
      @counter = 0
      @gas = gas
      @memory = {}
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

      @stack, @counter, @gas, @memory =
        instruction.call(stack:, counter:, gas:, memory:, context:)

      fail StackOverflow if @stack.size > MAX_STACK_DEPTH
      fail OutOfGas if @gas.negative?
    rescue ExecutionStopped
      self
    end
  end
end
