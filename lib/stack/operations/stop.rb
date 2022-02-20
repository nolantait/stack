# frozen_string_literal: true

module Stack
  class Stop < Operation
    # Stops contract execution which is rescued in the runtime.
    # This is an expected error and represents successful contract execution.

    def call
      fail ExecutionStopped
    end
  end
end
