# frozen_string_literal: true

module Stack
  class Caller < Operation
    def call(stack:, caller:, **)
      {
        stack: stack.unshift(caller.to_i(16))
      }
    end
  end
end
