# frozen_string_literal: true

module Stack
  class ConditionalJump < Operation
    # JUMP to a JUMPDEST depending on whether the top of the stack is 1 or 0
    # 1 = JUMP
    # 0 = Don't JUMP

    def call(stack:, counter:, **)
      stack, counter = update(stack, counter)

      {
        stack:,
        counter:
      }
    end

    private

    def update(stack, counter)
      case stack
        in [] | [_] then raise_missing_stack_values(stack)
        in [_, 0, *] then [stack.drop(2), counter + 1]
        in [destination, _, *] then [stack.drop(2), destination]
        else fail ArgumentError
      end
    end
  end
end
