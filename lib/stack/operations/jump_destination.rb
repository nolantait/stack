# frozen_string_literal: true

module Stack
  class JumpDestination < Operation
    def call(_args = [])
      # Does nothing with the stack.
      # Placeholder for a JUMP or JUMPI instruction destination
      {}
    end
  end
end
