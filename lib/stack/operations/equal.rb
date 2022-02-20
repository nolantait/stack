# frozen_string_literal: true

module Stack
  class Equal < Operation
    def call(stack:, **)
      {
        stack: update(stack)
      }
    end

    private

    def update(stack)
      case stack
        in [] | [_] then raise_missing_stack_values(stack)
        in [a, ^a, *] then stack.drop(2).unshift(1)
        in [a, b, *] then stack.drop(2).unshift(0)
        else fail ArgumentError
      end
    end
  end
end
