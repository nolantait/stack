# frozen_string_literal: true

require "dry-container"

require_relative "stack/version"
require_relative "stack/operation"
require_relative "stack/operations/add"
require_relative "stack/operations/multiply"
require_relative "stack/operations/subtract"
require_relative "stack/operations/divide"

# require_relative "stack/opcodes"
require_relative "stack/disassemble"

module Stack
  class Error < StandardError; end
  # Your code goes here...

  NotEnoughValues = Class.new(Error)

  def self.disassemble(bytecode)
    Disassemble.call(bytecode)
  end
end
