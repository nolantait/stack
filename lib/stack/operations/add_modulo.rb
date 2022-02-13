module Stack
  class AddModulo < Operation
    def call(stack)
      a, b, c, rest = stack

      raise_missing_stack_values(stack) if [a,b].compact.size > 2

      case [a, b, c]
      in [_, _, 0] then stack.drop(3).unshift(0)
      else stack.drop(3).unshift((a + b) % c)
      end
    end
  end
end
