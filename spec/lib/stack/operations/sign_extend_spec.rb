require "spec_helper"

RSpec.describe Stack::SignExtend do
  it "does something I'm sure I'll figure out in time" do
    stack = [1, 2, 3]
    expect(described_class[:SIGNEXTEND, 3].call(stack)).to eq [
      115792089237316195423570985008687907853269984665640564039457584007913129639950, 
      3
    ]
  end
end
