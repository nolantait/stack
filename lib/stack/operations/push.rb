# frozen_string_literal: true

module Stack
  class Push < Operation
    def call(stack:, operands:, **)
      {
        stack: stack.unshift(operands).flatten
      }
    end
  end
end
