# frozen_string_literal: true

module Stack
  class Stop < Operation
    def call
      fail ExecutionStopped
    end
  end
end
