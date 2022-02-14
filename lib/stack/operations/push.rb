module Stack
  class Push < Operation
    def call(stack:, operands:, **)
     return {
       stack: stack.unshift(operands).flatten
     }
    end
  end
end
