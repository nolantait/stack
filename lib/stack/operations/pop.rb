# frozen_string_literal: true

module Stack
  class Pop < Operation
    def call(stack:, **)
      {
        stack: update(stack)
      }
    end

    private

    def update(stack)
      case stack
        in [] then raise_missing_stack_values(stack)
        in [_, *] then stack.drop(1)
        else fail ArgumentError
      end
    end
  end
end
