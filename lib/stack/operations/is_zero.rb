module Stack
  class IsZero < Operation
    def call(stack)
      a = stack[0]
      raise_missing_stack_values(stack) if a.nil?

      a == 0 ? 
        stack.drop(1).unshift(1) :
        stack.drop(1).unshift(0)
    end
  end
end
