module Stack
  class And < Operation
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
      in [a, b, *] then stack.drop(2).unshift(a & b)
      else raise ArgumentError
      end
    end
  end
end
