# frozen_string_literal: true

module Stack
  class MemoryStore < Operation
    def call(stack:, memory:, **)
      {
        memory: update(stack, memory),
        stack: stack.drop(2)
      }
    end

    def update(stack, memory)
      case stack
        in [] | [_] then raise_missing_stack_values(stack)
        in [a, b, *]
          memory[a] = b
          return memory
        else fail ArgumentError
      end
    end
  end
end
