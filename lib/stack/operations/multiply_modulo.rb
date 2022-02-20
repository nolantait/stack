# frozen_string_literal: true

module Stack
  class MultiplyModulo < Operation
    def call(stack:, **)
      {
        stack: update(stack)
      }
    end

    def update(stack)
      case stack
        in [] | [_] | [_, _] then raise_missing_stack_values(stack)
        in [_, _, 0, *] then stack.drop(3).unshift(0)
        in [a, b, c, *] then stack.drop(3).unshift((a * b) % c)
        else fail ArgumentError
      end
    end
  end
end
