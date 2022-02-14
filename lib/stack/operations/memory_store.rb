module Stack
  class MemoryStore < Operation
    def call(stack:, memory:, **)
      return {
        memory: update(stack, memory),
        stack: stack.drop(2)
      }
    end

    def update(stack, memory)
      case stack
      in [] then raise_missing_stack_values(stack)
      in [_] then raise_missing_stack_values(stack)
      in [a, b, *]
        memory[a] = b
        return memory
      else raise ArgumentError
      end
    end
  end
end
