# frozen_string_literal: true

module Stack
  class Instruction
    # Instructions take single or grouped opcodes and their operands and turn
    # them into callable functions which manipulate the stack and other
    # runtime environment variables
    #
    # Stack: Used to place parameters used for instructions to execute
    # Counter: The position of the program during runtime, used for JUMPing
    # Gas: The gas used for contract execution, measured in WEI
    # Memory: Exists only during smart contract execution
    # Storage: Persistent memory stored inside the smart contract itself
    # Context: Contains call data, access sets and other auxilary data

    include Dry::Equalizer(:opcode, :operands)

    attr_reader :opcode, :total_bytes, :operands

    def initialize(*bytes)
      @opcode = bytes[0] # The opcode register for the operation like ADD
      @operands = bytes[1..] # The arguments for the instruction for PUSH1..32
      @total_bytes = bytes.size # The total bytes in this instruction
      @operator = Opcodes["0x#{@opcode}"] # The operation to be performed
    end

    # Call is written this way to allow easier writing of opcode functions.
    # Default values allow operations to omit return values if they do not
    # modify them.
    # Environment(stack:, counter:, gas;, memory:, context:)
    def call(**environment)
      next_state = @operator.call(operands: @operands, **environment)

      [
        next_state.fetch(:stack, environment.fetch(:stack)),
        next_state.fetch(:counter, @total_bytes),
        next_state.fetch(:gas, environment.fetch(:gas) - @operator.gas_cost),
        next_state.fetch(:memory, environment.fetch(:memory))
      ]
    end

    def name
      @operator.name
    end

    def gas_cost
      @operator.gas_cost
    end
  end
end
