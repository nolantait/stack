# frozen_string_literal: true

module Stack
  class Balance < Operation
    def call(stack:, access_sets:, **)
      raise_missing_stack_values(stack) unless stack.size.positive?

      balance = access_sets["0x#{stack[0].to_s(16)}"].fetch(:balance)

      {
        stack: stack.drop(1).unshift(balance)
      }
    end
  end
end
