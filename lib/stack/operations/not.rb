module Stack
  class Not < Operation
    def call(stack)
      a = stack[0]
      raise_missing_stack_values(stack) if a.nil?

      stack.drop(1).unshift(~a)
    end
  end
end
