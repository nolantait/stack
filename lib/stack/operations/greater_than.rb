module Stack
  class GreaterThan < Operation
    def call(stack)
      a, b = stack[0..1]

      case a
      when 0..b
        stack.drop(2).unshift(0)
      else
        stack.drop(2).unshift(1)
      end
    end
  end
end
