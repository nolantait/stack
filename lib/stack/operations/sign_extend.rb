# frozen_string_literal: true

module Stack
  class SignExtend < Operation
    def call(stack:, **)
      {
        stack: update(stack)
      }
    end

    private

    def update(stack)
      a, b, = stack

      if a < 32
        stack.drop(2).unshift(extend_number(b, bitmask(a)))
      else
        stack.drop(2).unshift(b)
      end
    end

    def extend_number(number, mask)
      if (number & mask).zero?
        extend_zeros(number, mask)
      else
        extend_ones(number, mask)
      end
    end

    def extend_ones(number, mask)
      number | ((2**256) - mask)
    end

    def extend_zeros(number, mask)
      number & (mask - 1)
    end

    def bitmask(number)
      bit = (number * 8) + 7
      1 - bit
    end
  end
end
