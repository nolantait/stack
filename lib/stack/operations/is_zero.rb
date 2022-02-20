# frozen_string_literal: true

module Stack
  class IsZero < Operation
    # Pushes 1 or 0 to the stack depending on if the top of the stack is 0 or 1
    # Top is 0 => Push 1
    # Top is 1 => Push 0

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
