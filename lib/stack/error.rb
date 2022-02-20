# frozen_string_literal: true

module Stack
  class Error < StandardError; end

  # Raised by operations when a stack does not have enough arguments
  MissingStackValues = Class.new(Error)

  # Called during STOP opcode 0x00 and rescued in the runtime to return
  # itself.
  ExecutionStopped = Class.new(Error)
end
