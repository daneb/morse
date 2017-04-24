require 'spec_helper'

RSpec.describe Morse::Helpers::Validation do
  # MH = Morse::Helpers

  it 'determines if there are non-alphanumerics in a string' do
    content = 'Symphony No.9, is a rather fantastical beast'
    expect(MH::Validation.contains_non_alphanumeric?(content)).to eq true
  end

  it 'does not detect non-alphanumerics when there is none' do
    content = 'Symphony Number 9 is a rather fantastical beast'
    expect(MH::Validation.contains_non_alphanumeric?(content)).to eq false
  end
end
