require 'spec_helper'

RSpec.describe Morse::Translation::Translator do
  it 'translates text to morse' do
    translator = Class.new
    translator.extend Morse::Translation::Translator
    sentence = 'I AM IN TROUBLE'
    result = '../.-|--/..|-./-|.-.|---|..-|-...|.-..|.'
    expect(translator.translate(sentence)).to eq result
  end
end