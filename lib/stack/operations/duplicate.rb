# frozen_string_literal: true

module Stack
  class Duplicate < Operation
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
