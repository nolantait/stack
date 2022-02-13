module Stack
  class Subtract < Operation
    def call(stack)
      a, b, rest = stack
      stack.drop(2).unshift(a - b)
    end
  end
end
