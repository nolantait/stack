require "spec_helper"

RSpec.describe Stack::Stop do
  it "raises a execution stopped error" do
    expect{ described_class[:STOP, 0].call }.to raise_error Stack::ExecutionStopped
  end
end
