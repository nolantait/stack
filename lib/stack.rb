# frozen_string_literal: true

require "dry-container"

require_relative "stack/version"
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

require_relative "stack/opcodes"
require_relative "stack/instruction"
require_relative "stack/runtime"
require_relative "stack/disassemble"
require_relative "stack/bytecode"

module Stack
  class Error < StandardError; end
  # Your code goes here...

  NotEnoughValues = Class.new(Error)

  def self.disassemble(bytecode)
    Disassemble.call(bytecode)
  end
end
