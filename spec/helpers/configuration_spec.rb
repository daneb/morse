require 'spec_helper'

RSpec.describe 'Configuration' do
  MH = Morse::Helpers

  it 'loads datasource provider from configuration' do
    expect(MH::Configuration.load_config['datasource'].key?('type')).to eq true
  end

  it 'raises an error if file is not found' do
    allow(File).to receive(:exist?).and_return(false)
    expect { MH::Configuration.load_config }.to raise_error IOError
  end
end