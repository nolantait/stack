# frozen_string_literal: true

module Stack
  class Caller < Operation
    # Pushes the caller of the contract onto the stack
    # Caller differs from Address in that the caller is the one who wanted
    # to execute the contract and the address is the contract itself.

    def call(stack:, caller:, **)
      {
        stack: stack.unshift(caller.to_i(16))
      }
    end
  end
end
