module Stack
  class AddModulo < Operation
    def call(stack:, **)
      return {
        stack: update(stack)
      }
    end

    private

    def update(stack)
      case stack
      in [] then raise_missing_stack_values(stack)
      in [_] then raise_missing_stack_values(stack)
      in [_, _] then raise_missing_stack_values(stack)
      in [_, _, 0, *] then stack.drop(3).unshift(0)
      in [a, b, c, *] then stack.drop(3).unshift((a + b) % c)
      else raise ArgumentError
      end
    end
  end
end
