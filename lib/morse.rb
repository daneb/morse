require 'morse/version'
require 'providers/data_provider'
require 'helpers/validation'
require 'helpers/sanitize'
require 'helpers/morse_error'
require 'translation/translator'
require 'obfuscation/obfuscator'
require 'byebug'

module Morse
  extend Translation::Translator
  extend Obfuscation::Obfuscator

  HV = Morse::Helpers::Validation
  HS = Morse::Helpers::Sanitize
  
  def self.translate_text(content)
    raise ArgumentError if HV.contains_non_alphanumeric?(content)
    text = HS.substitute_content(content)
    translate(text)
  rescue ArgumentError
    raise Helpers::Error, 'Only alphanumerics supported as input'
  rescue => e
    raise Helpers::Error, 'Unexpected Error ' + e.message
  end

  def self.confound_translation(morse_code)
    obfuscate(morse_code)
  rescue ArgumentError
    raise Helpers::Error, 'Only alphanumerics supported as input'
  rescue => e
    raise Helpers::Error, 'Unexpected Error ' + e.message
  end
  
  def self.confound(content)
    morse_code = translate_text(content)
    confound_translation(morse_code)
  end
end
