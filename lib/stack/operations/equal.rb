module Stack
  class Equal < Operation
    def call(stack)
      a, b = stack[0..1]
      raise_missing_stack_values(stack) if b.nil?

      a == b ? 
        stack.drop(2).unshift(1) :
        stack.drop(2).unshift(0)
    end
  end
end
