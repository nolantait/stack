# frozen_string_literal: true

module Stack
  class Divide < Operation
    def call(stack:, **)
      {
        stack: update(stack)
      }
    end

    private

    def update(stack)
      case stack
        in [] | [_] then raise_missing_stack_values(stack)
        in [_, 0, *] then stack.drop(2).unshift(0)
        in [a, b, *] then stack.drop(2).unshift(a / b)
        else fail ArgumentError
      end
    end
  end
end
