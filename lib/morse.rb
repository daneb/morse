require 'morse/version'
require 'byebug'

module Morse
  def self.translate(sentence)
    lookup = { 'A' => '.-',
               'B' => '-...',
               'C' => '-.-.',
               'D' => '-..',
               'E' => '.',
               'F' => '..-.',
               'G' => '--.',
               'H' => '....',
               'I' => '..',
               'J' => '.---',
               'K' => '-.-',
               'L' => '.-..',
               'M' => '--',
               'N' => '-.',
               'O' => '---',
               'P' => '.--.',
               'Q' => '--.-',
               'R' => '.-.',
               'S' => '...',
               'T' => '-',
               'U' => '..-',
               'V' => '...-',
               'W' => '.--',
               'X' => '-..-',
               'Y' => '-.--',
               'Z' => '--..',
               '0' => '-----',
               '1' => '.----',
               '2' => '..---',
               '3' => '...--',
               '4' => '....-',
               '5' => '.....',
               '6' => '-....',
               '7' => '--...',
               '8' => '---..',
               '9' => '----.',
               'Fullstop' => '.-.-.-',
               'Comma' => '--..--' }
    accumalator = ''
    input_char_array = sentence.chars
    input_char_array.each_with_index do |letter, index|
      input = letter.strip
      suffix = '|' # default
      suffix = '/' if input.empty? # Current single_char is a space
      forward_index = index + 1 < input_char_array.length ? (index + 1) : index
      suffix = '' if input_char_array[forward_index].strip.empty?
      suffix = '' if (index + 1) == input_char_array.length
      accumalator.concat(lookup.fetch(letter, '')).concat(suffix)
    end
    accumalator
  end

  def self.obfuscate(morse_code)
    
  end
end
