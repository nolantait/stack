module Stack
  class GreaterThan < Operation
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
      in [a, b, *] then a > b ? stack.drop(2).unshift(1) : stack.drop(2).unshift(0)
      else raise ArgumentError
      end
    end
  end
end
