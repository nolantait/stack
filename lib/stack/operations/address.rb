# frozen_string_literal: true

module Stack
  class Address < Operation
    def call(stack:, address:, **)
      {
        stack: stack.unshift(address.to_i(16))
      }
    end
  end
end
