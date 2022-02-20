# frozen_string_literal: true

module Stack
  class JumpDestination < Operation
    # Does nothing with the stack.
    # Placeholder for a JUMP or JUMPI instruction destination
    # Not sure how best to represent this.

    def call(_args = [])
      {}
    end
  end
end
