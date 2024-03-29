# frozen_string_literal: true

module Stack
  class Swap < Operation
    # Exchange two stack items.
    # SWAP1 swaps first and second
    # SWAP2 swaps first and third
    # And so on... up to SWAP16

    def call(stack:, **)
      raise_missing_stack_values(stack) if stack.size < depth

      stack[0], stack[depth - 1] = stack[depth - 1], stack[0]

      {
        stack:
      }
    end

    def depth
      @name.to_s.gsub("SWAP", "").to_i
    end
  end
end
