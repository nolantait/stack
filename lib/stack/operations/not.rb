# frozen_string_literal: true

module Stack
  class Not < Operation
    # Not is used here as the bitwise operation ~ not the other ! boolean logic

    def call(stack:, **)
      {
        stack: update(stack)
      }
    end

    private

    def update(stack)
      case stack
        in [] then raise_missing_stack_values(stack)
        in [a, *] then stack.drop(1).unshift(~a)
        else fail ArgumentError
      end
    end
  end
end
