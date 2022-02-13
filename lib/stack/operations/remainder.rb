module Stack
  class Remainder < Operation
    def call(stack)
      a, b, rest = stack

      case b
      when nil then raise_missing_stack_values(stack)
      when 0 then stack.drop(2).unshift(0)
      else stack.drop(2).unshift(a % b)
      end
    end
  end
end
