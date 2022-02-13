module Stack
  class Or < Operation
    def call(stack)
      a, b = stack[0..1]
      raise_missing_stack_values(stack) if b.nil?

      stack.drop(2).unshift(a | b)
    end
  end
end
