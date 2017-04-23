require 'spec_helper'

RSpec.describe Morse do
  it 'has a version number' do
    expect(Morse::VERSION).not_to be nil
  end

  describe 'use cases for translation' do
    it 'translates a simple sentence into morse code' do
      sentence = 'I AM IN TROUBLE'
      result = '../.-|--/..|-./-|.-.|---|..-|-...|.-..|.'
      expect(Morse.translate(sentence)).to eq result
    end

    it 'translates a sentence ignoring multiple spaces' do
      sentence = 'I  AM    IN     TROUBLE    '
      result = '../.-|--/..|-./-|.-.|---|..-|-...|.-..|.'
      expect(Morse.translate(sentence)).to eq result
    end

    it 'translates a sentence with Fullstop' do
      sentence = 'I AM IN TROUBLEFullStop'
      result = '../.-|--/..|-./-|.-.|---|..-|-...|.-..|.|.-.-.-'
      expect(Morse.translate(sentence)).to eq result
    end
  end

  describe 'use cases for obfuscating' do
    it 'obfuscates morse code' do
      morse_code = '../.-|--/..|-./-|.-.|---|..-|-...|.-..|.'
      result = '2/1A|B/2|A1/A|1A1|C|2A|A3|1A2|1'
      expect(Morse.confound_translation(morse_code)).to eq result
    end

    it 'translates and obfuscates a sentence' do
      sentence = 'I AM IN TROUBLE'
      result = '2/1A|B/2|A1/A|1A1|C|2A|A3|1A2|1'
      expect(Morse.confound(sentence)).to eq result
    end

    it 'translates and obfuscates a word' do
      word = 'HELLO'
      result = '4|1|1A2|1A2|C'
      expect(Morse.confound(word)).to eq result
    end
  end

  describe 'error handling' do
  end

  describe 'non-functional requirements' do
  end
end
