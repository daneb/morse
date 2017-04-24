module Morse 
  module Translation
    module Translator
      def translate(some_text)
        translation = ''
        text_char_array = some_text.chars
        text_char_array.each_with_index do |letter, index|
          input = letter.strip
          suffix = '|'  # default (| space between letters)
          suffix = '/' if input.empty? # (/ space between words)
          forward_index = index + 1 < text_char_array.length ? (index + 1) : index
          suffix = '' if text_char_array[forward_index].strip.empty?
          suffix = '' if (index + 1) == text_char_array.length
          value = Providers::DataProvider.morse_lookup(letter.upcase)
          translation.concat(value).concat(suffix)
        end
        translation
      end
    end
  end
end