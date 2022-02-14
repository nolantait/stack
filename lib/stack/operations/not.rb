module Stack
  class Not < Operation
    def call(stack:, **)
      return {
        stack: update(stack)
      }
    end

    private

    def update(stack)
      case stack
      in [] then raise_missing_stack_values(stack)
      in [a, *] then stack.drop(1).unshift(~a)
      else raise ArgumentError
      end
    end
  end
end
