# frozen_string_literal: true

RSpec.describe Stack do
  it "has a version number" do
    expect(Stack::VERSION).not_to be nil
  end

  # Uses https://github.com/CoinCulture/evm-tools/blob/master/analysis/ethersignal/ethersignal.md
  # as a reference for implementation

  describe "#disassemble" do
    it "disassembles the bytecode into the expected trace" do
      # EthersSignal contract, source @ https://github.com/CoinCulture/evm-tools/blob/master/analysis/ethersignal/ethersignal.md
      bytecode = "60606040523615601d5760e060020a60003504637a6668bf81146023575b" \
                 "603f6002565b603f60043560243560005b6110008110156046575b600101602e565b005b" \
                 "505050565b606082815273ffffffffffffffffffffffffffffffffffffffff3316608052" \
                 "83907fdfe72b85658ece2ea9a0485273e99806605f396deff71c0650ea0e4bb691ca8b90" \
                 "604090a273ffffffffffffffffffffffffffffffffffffffff3381169060009030163160" \
                 "6082818181858883f193505050501515604157600256"
      expected_stacktrace = File.read("spec/fixtures/stacktrace/ether-signal.txt")

      expect(described_class.disassemble(bytecode)).to eq(expected_stacktrace)
    end
  end
end
