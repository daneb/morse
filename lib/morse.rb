require 'morse/version'
require 'providers/data_provider'
require 'helpers/sanitize'
require 'translation/translator'
require 'obfuscation/obfuscator'
require 'byebug'

module Morse
  extend Translation::Translator
  extend Obfuscation::Obfuscator

  def self.translate_text(content)
    text = Helpers::Sanitize.substitute_content(content)
    translate(text)
  end

  def self.sanitize_user_input(content)
    content.gsub(/Fullstop/, '.').gsub(/Comma/, ',')
  end

  def self.confound(content)
    morse_code = translate_text(content)
    confound_translation(morse_code)
  end

  def self.confound_translation(morse_code)
    obfuscate(morse_code)
  end
end
