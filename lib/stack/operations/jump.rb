module Stack
  class Jump < Operation
    def call(stack)
      # Does nothing
      # Handled by the Stack::Runtime to execute control flow with the counter
      return stack
    end
  end
end
