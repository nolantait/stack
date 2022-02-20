# frozen_string_literal: true

module Stack
  class IsZero < Operation
    def call(stack:, **)
      {
        stack: update(stack)
      }
    end

    private

    def update(stack)
      case stack
        in [] then raise_missing_stack_values(stack)
        in [a, *] then a.zero? ? stack.drop(1).unshift(1) : stack.drop(1).unshift(0)
        else fail ArgumentError
      end
    end
  end
end
