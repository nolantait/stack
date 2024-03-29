# frozen_string_literal: true

module Stack
  class Log < Operation
    def call(stack:, memory:, **)
      raise_missing_stack_values(stack) if stack.size < 2 + depth

      log = {
        data: data(stack, memory),
        topics: depth.zero? ? [] : stack[2..(2 + depth)]
      }

      {
        stack: stack.drop(2 + depth),
        logs: [log]
      }
    end

    def data(stack, memory)
      offset = stack[0]
      size = stack[1]
      slots = size / 32

      [].tap do |items|
        items.push(memory[offset])
        slots.times do |addition|
          items.push(memory[offset + addition + 1])
        end
      end
    end

    def depth
      @name.to_s.gsub("LOG", "").to_i
    end
  end
end
