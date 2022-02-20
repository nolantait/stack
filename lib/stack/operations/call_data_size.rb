# frozen_string_literal: true

module Stack
  class CallDataSize < Operation
    def call(stack:, data:, **)
      # Currently does nothing, just returns 0
      {
        stack: stack.unshift(data.size)
      }
    end
  end
end
