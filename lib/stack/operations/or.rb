# frozen_string_literal: true

module Stack
  class Or < Operation
    # Or is used here as the bitwise operation | not the other || boolean logic

    def call(stack:, **)
      {
        stack: update(stack)
      }
    end

    private

    def update(stack)
      case stack
        in [] | [_] then raise_missing_stack_values(stack)
        in [a, b, *] then stack.drop(2).unshift(a | b)
        else fail ArgumentError
      end
    end
  end
end
