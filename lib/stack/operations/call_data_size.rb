# frozen_string_literal: true

module Stack
  class CallDataSize < Operation
    def call(stack:, **)
      # Currently does nothing, just returns 0
      {
        stack: stack.unshift(0)
      }
    end
  end
end
