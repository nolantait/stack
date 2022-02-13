module Stack
  class Operation
    def self.[](name, gas_cost)
      new(name, gas_cost)
    end

    attr_reader :arguments

    def initialize(name, gas_cost)
      @name = name
      @gas_cost = gas_cost
    end

    def call(stack)
      raise NotImplementedError
    end
  end
end
