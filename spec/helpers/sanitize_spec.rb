require 'spec_helper'

RSpec.describe Morse::Helpers::Sanitize do
  MH = Morse::Helpers

  it 'string replaces Fullstop and Comma' do
    content = 'FullstopComma'
    expect(MH::Sanitize.substitute_content(content)).to eq '.,'
  end
end