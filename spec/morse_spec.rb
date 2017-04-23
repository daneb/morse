require "spec_helper"

RSpec.describe Morse do
  it "has a version number" do
    expect(Morse::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
