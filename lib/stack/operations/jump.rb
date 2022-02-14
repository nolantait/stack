module Stack
  class Jump < Operation
    def call(stack:, counter:)
      destination, rest = stack

      return {
        stack: stack.drop(1),
        counter: destination
      }
    end
  end
end
