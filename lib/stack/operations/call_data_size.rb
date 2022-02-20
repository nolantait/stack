# frozen_string_literal: true

module Stack
  class CallDataSize < Operation
    # Returns the bytecode size (each byte, so 3240 is two bytes)
    # Currently does nothing, just returns 0

    def call(stack:, data:, **)
      {
        stack: stack.unshift(data.size)
      }
    end
  end
end
