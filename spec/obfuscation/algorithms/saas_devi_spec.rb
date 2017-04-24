require 'spec_helper'

RSpec.describe Morse::Obfuscation::Algorithms::SaasDevi do
  # MOA = Morse::Obfuscation::Algorithms

  it 'counts first consecutive number of dots where word begins with a dot' do
    word = '...-..-'
    result = 3
    expect(MOA::SaasDevi.count_of_dots(word)).to eq result
  end

  it 'counts first consecutive numbers of dashes where word begins with a dash' do
    word = '---..----'
    result = 3
    expect(MOA::SaasDevi.count_of_dashes(word)).to eq result
  end

  it 'recursively obfuscates a word appending' do
    word = '--...-.'
    result = 'B3A1'
    expect(MOA::SaasDevi.obfuscate_word(word)).to eq result
  end

  it 'splits word, individually obfuscates, combines and chomps last character' do
    word = '../.-|--'
    result = '2/1A|B'
    expect(MOA::SaasDevi.obfuscate(word)).to eq result
  end
end