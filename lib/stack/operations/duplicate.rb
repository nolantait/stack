# frozen_string_literal: true

module Stack
  class Duplicate < Operation
    # Duplicate N values from the stack
    # DUP1 duplicates 1
    # DUP2 duplicates 2
    # And so on... up to DUP16

    def call(stack:, **)
      raise_missing_stack_values(stack) if stack.size < depth

      {
        stack: stack.unshift(stack[0..depth]).flatten
      }
    end

    def depth
      @name.to_s.gsub("DUP", "").to_i
    end
  end
end
