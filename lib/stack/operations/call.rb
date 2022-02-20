# frozen_string_literal: true

module Stack
  class Call < Operation
    # Call stubbed to just return 1 for now.
    # TODO: implement calling other contracts

    Success = ->(*) { 1 }
    Failure = ->(*) { 0 }

    def call(stack:, subcontractor: Success, **)
      raise_missing_stack_values(stack) unless stack.size >= 7

      returned_value = subcontractor.call(*stack[0..6]) # 0 or 1

      {
        stack: stack.drop(7).unshift(returned_value)
      }
    end
  end
end
