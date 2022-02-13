module Stack
  class Multiply < Operation
    def call(stack)
      a, b, rest = stack
      stack.drop(2).unshift(a * b)
    end
  end
end
