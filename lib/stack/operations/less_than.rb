# frozen_string_literal: true

module Stack
  class LessThan < Operation
    def call(stack:, **)
      {
        stack: update(stack)
      }
    end

    private

    def update(stack)
      case stack
        in [] | [_] then raise_missing_stack_values(stack)
        in [a, b, *] then a < b ? stack.drop(2).unshift(1) : stack.drop(2).unshift(0)
        else fail ArgumentError
      end
    end
  end
end
