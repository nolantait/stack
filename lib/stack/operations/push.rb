module Stack
  class Push < Operation
    def call(stack, *args)
     stack.unshift(*args)
    end
  end
end
