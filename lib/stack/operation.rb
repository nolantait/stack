# frozen_string_literal: true

module Stack
  class Operation
    # All operations inherit from this class
    # A minimal implementation handles #call which should manipulate the runtime
    # environment and return environment state after the operation completes.

    # Allows initialization with a hash syntax:
    # e.g. Stop[:STOP, 3]
    def self.[](name, gas_cost)
      new(name, gas_cost)
    end

    attr_reader :name, :gas_cost

    def initialize(name, gas_cost)
      @name = name
      @gas_cost = gas_cost
    end

    def call(runtime)
      fail NotImplementedError
    end

    def to_s
      "#{self.class.name}(name: #{@name}, gas_cost: #{@gas_cost})"
    end

    def raise_missing_stack_values(stack)
      fail MissingStackValues,
           "#{self.class.name} was missing stack values with stack #{stack}"
    end
  end
end
