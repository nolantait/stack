# frozen_string_literal: true

module Stack
  class Jump < Operation
    def call(stack:, **)
      destination, = stack

      {
        stack: stack.drop(1),
        counter: destination
      }
    end
  end
end
