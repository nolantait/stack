# frozen_string_literal: true

module Stack
  class CallDataLoad < Operation
    # Loads bytecode from an external contract and pushes it onto the stack.
    #
    # Currently does nothing, just removes an item from the stack.
    # TODO: Implement this properly

    def call(stack:, data:, **)
      {
        stack: update(stack, data)
      }
    end

    private

    def update(stack, data)
      case stack
        in [] then raise_missing_stack_values(stack)
        in [offset, *] then stack.drop(1).unshift(data[offset..]).flatten
        else fail ArgumentError
      end
    end
  end
end
