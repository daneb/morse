require 'spec_helper'

RSpec.describe Morse do
  it 'has a version number' do
    expect(Morse::VERSION).not_to be nil
  end

  describe 'use cases for translation' do
    it 'translates a simple sentence into morse code' do
      sentence = 'I AM IN TROUBLE'
      result = '../.-|--/..|-./-|.-.|---|..-|-...|.-..|.'
      expect(Morse.translate_text(sentence)).to eq result
    end

    it 'translates a sentence ignoring multiple spaces' do
      sentence = 'I  AM    IN     TROUBLE    '
      result = '../.-|--/..|-./-|.-.|---|..-|-...|.-..|.'
      expect(Morse.translate_text(sentence)).to eq result
    end

    it 'translates a sentence with Fullstop' do
      sentence = 'I AM IN TROUBLE Fullstop'
      result = '../.-|--/..|-./-|.-.|---|..-|-...|.-..|./.-.-.-'
      expect(Morse.translate_text(sentence)).to eq result
    end

    it 'translates Fullstop' do
      word = 'Fullstop'
      result = '.-.-.-'
      expect(Morse.translate_text(word)).to eq result
    end

    it 'translates Comma' do
      word = 'Comma'
      result = '--..--'
      expect(Morse.translate_text(word)).to eq result
    end
  end

  describe 'use cases for obfuscating morse code' do
    it 'obfuscates morse code' do
      morse_code = '../.-|--/..|-./-|.-.|---|..-|-...|.-..|.'
      result = '2/1A|B/2|A1/A|1A1|C|2A|A3|1A2|1'
      expect(Morse.confound_translation(morse_code)).to eq result
    end

    it 'obfuscates Comma from morse' do
      morse = '--..--'
      result = 'B2B'
      expect(Morse.confound_translation(morse)).to eq result
    end

    it 'obfuscates Fullstop from morse' do
      morse = '.-.-.-'
      result = '1A1A1A'
      expect(Morse.confound_translation(morse)).to eq result
    end
  end

  describe 'use cases for obfuscating from english' do
    it 'translates and obfuscates a sentence' do
      sentence = 'I AM IN TROUBLE'
      result = '2/1A|B/2|A1/A|1A1|C|2A|A3|1A2|1'
      expect(Morse.confound(sentence)).to eq result
    end

    it 'translates and obfuscates a sentence with Fullstop' do
      sentence = 'I AM IN TROUBLE Fullstop'
      result = '2/1A|B/2|A1/A|1A1|C|2A|A3|1A2|1/1A1A1A'
      expect(Morse.confound(sentence)).to eq result
    end

    it 'translates and obfuscates a word' do
      word = 'HELLO'
      result = '4|1|1A2|1A2|C'
      expect(Morse.confound(word)).to eq result
    end
  end

  describe 'error handling' do
    it 'raises an error if there is an alphanumeric' do
      word = 'HELLO.=""'
      expect{ Morse.translate_text(word) }.to raise_error Morse::Helpers::Error
    end
  end

  describe 'non-functional requirements' do
  end
end
