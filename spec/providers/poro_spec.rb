require 'spec_helper'

RSpec.describe Morse::Providers::Poro do
  before :all do
    @poro = Morse::Providers::Poro.new
  end

  it 'queries a datasource for char key to morse code value' do
    expect(@poro.query_morse('A')).to eq '.-'
    expect(@poro.query_morse('B')).to eq '-...'
    expect(@poro.query_morse('P')).to eq '.--.'
    expect(@poro.query_morse('9')).to eq '----.'
  end

  it 'queries a datasource for a dash count to char value' do
    expect(@poro.query_dash('1')).to eq 'A'
    expect(@poro.query_dash('5')).to eq 'E'
  end

  it 'has a hack for easily supporting . and ,' do
    expect(@poro.query_morse('.')).to eq '.-.-.-'
    expect(@poro.query_morse(',')).to eq '--..--'
  end
end
