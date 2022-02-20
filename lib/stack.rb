# frozen_string_literal: true

# All requirements are loaded from this file.
# No other files shall contain require statements.
require "dry-container"
require "dry-equalizer"

require_relative "stack/version"
require_relative "stack/error"
require_relative "stack/operation"
require_relative "stack/operations/add"
require_relative "stack/operations/multiply"
require_relative "stack/operations/subtract"
require_relative "stack/operations/divide"
require_relative "stack/operations/modulo"
require_relative "stack/operations/add_modulo"
require_relative "stack/operations/multiply_modulo"
require_relative "stack/operations/exponent"
require_relative "stack/operations/sign_extend"
require_relative "stack/operations/less_than"
require_relative "stack/operations/greater_than"
require_relative "stack/operations/equal"
require_relative "stack/operations/is_zero"
require_relative "stack/operations/and"
require_relative "stack/operations/or"
require_relative "stack/operations/exclusive_or"
require_relative "stack/operations/not"
require_relative "stack/operations/push"
require_relative "stack/operations/jump"
require_relative "stack/operations/jump_destination"
require_relative "stack/operations/stop"
require_relative "stack/operations/memory_store"
require_relative "stack/operations/call_data_size"
require_relative "stack/operations/conditional_jump"
require_relative "stack/operations/call_data_load"
require_relative "stack/operations/duplicate"
require_relative "stack/operations/pop"
require_relative "stack/operations/caller"
require_relative "stack/operations/swap"
require_relative "stack/operations/log"
require_relative "stack/operations/address"
require_relative "stack/operations/balance"
require_relative "stack/operations/call"

require_relative "stack/opcodes"
require_relative "stack/instruction"
require_relative "stack/runtime"
require_relative "stack/disassemble"
require_relative "stack/bytecode"

module Stack
  # Stack is a ruby implementation of the Ethereum EVM which is particularly
  # well suited for learning about how things work as ruby code can be
  # remarkably expressable while still being correct vs pseudo code which can be
  # quite abstract. Ruby is beautiful.

  def self.disassemble(bytecode)
    Disassemble.call(bytecode)
  end
end
