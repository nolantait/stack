module Stack
  class Operation
    def self.[](name, gas_cost)
      new(name, gas_cost)
    end

    attr_reader :name, :gas_cost

    def initialize(name, gas_cost)
      @name = name
      @gas_cost = gas_cost
    end

    def call(runtime)
      raise NotImplementedError
    end
    
    def to_s
      "#{self.class.name}(name: #{@name}, gas_cost: #{@gas_cost})"
    end

    def raise_missing_stack_values(stack)
      raise MissingStackValues, 
        "#{self.class.name} was missing stack values with stack #{stack}"
    end
  end
end
