module Stack
  class IsZero < Operation
    def call(stack:, **)
      return {
        stack: update(stack)
      }
    end

    private

    def update(stack)
      case stack
      in [] then raise_missing_stack_values(stack)
      in [a, *] then a === 0 ? stack.drop(1).unshift(1) : stack.drop(1).unshift(0)
      else raise ArgumentError
      end
    end
  end
end
