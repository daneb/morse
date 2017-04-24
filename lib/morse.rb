require 'morse/version'
require 'providers/data_provider'
require 'byebug'

module Morse
  extend Providers::DataProvider 
  def self.translate(sentence)
    translation = ''
    sentence.gsub!(/Fullstop/, '.')
    sentence.gsub!(/Comma/, ',')
    input_char_array = sentence.chars
    input_char_array.each_with_index do |letter, index|
      input = letter.strip
      suffix = '|' # default
      suffix = '/' if input.empty? # Current single_char is a space
      forward_index = index + 1 < input_char_array.length ? (index + 1) : index
      suffix = '' if input_char_array[forward_index].strip.empty?
      suffix = '' if (index + 1) == input_char_array.length
      translation.concat(lookup(letter.upcase)).concat(suffix)
    end
    translation
  end

  def self.confound(sentence)
    morse_code = translate(sentence)
    confound_translation(morse_code)
  end

  def self.confound_translation(morse_code)
    result = ''
    words = split_by_words morse_code
    words.each { |word| result << obfuscate_word(word) + '/' }
    result.chomp('/')
  end

  def self.dash_lookup(number)
    {
      '1' => 'A',
      '2' => 'B',
      '3' => 'C',
      '4' => 'D',
      '5' => 'E' 
    }[number]
  end

  def self.split_by_words(morse_code)
    morse_code.split('/')
  end

  def self.obfuscate_word(word, result = '')
    return result if word.empty?
    count = 0
    if word[0] == '.'
      count = word.scan(/^\.+/)[0].length
      result << count.to_s
    elsif word[0] == '-'
      count = word.scan(/^\-+/)[0].length
      result << dash_lookup(count.to_s)
    elsif word[0] == '|'
      count = 1
      result << '|'
    end
    obfuscate_word(word[count..-1], result)
  end
end
