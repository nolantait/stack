module Stack
  class SignExtend < Operation
    def call(stack)
      a, b, rest = stack

      case a
      when 1..32
        bit = a * 8 + 7
        mask = 1 - bit
        if b & mask == 0 # extend 0's
          stack.drop(2).unshift(b & (mask - 1))
        else # extend 1's
          stack.drop(2).unshift(b | ((2**256) - mask))
        end
      else
        stack.drop(2).unshift(b)
      end
    end
  end
end
