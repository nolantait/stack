module Stack
  class Equal < Operation
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
      in [a, ^a, *] then stack.drop(2).unshift(1)
      in [a, b, *] then stack.drop(2).unshift(0)
      else raise ArgumentError
      end
    end
  end
end
