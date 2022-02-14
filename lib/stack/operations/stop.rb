module Stack
  class Stop < Operation
    def call
      raise ExecutionStopped
    end
  end
end
