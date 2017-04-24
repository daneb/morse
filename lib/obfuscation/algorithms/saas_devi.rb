module Morse
  module Obfuscation
    module Algorithms
      module SaasDevi
        def self.obfuscate(morse_code)
          result = ''
          words = split_by_words morse_code
          words.each { |word| result << obfuscate_word(word) + '/' }
          result.chomp('/')
        end

        def self.split_by_words(morse_code)
          morse_code.split('/')
        end

        def self.obfuscate_word(word, result = '')
          return result if word.empty?
          count = 0
          if word[0] == '.'
            count = count_of_dots(word)
            result << count.to_s
          elsif word[0] == '-'
            count = lookup_dash_count(word)
            result << Providers::DataProvider.dash_lookup(count.to_s)
          elsif word[0] == '|'
            count = 1
            result << '|'
          end
          obfuscate_word(word[count..-1], result)
        end

        def self.count_of_dots(word)
          word.scan(/^\.+/)[0].length
        end

        def self.lookup_dash_count(word)
          word.scan(/^\-+/)[0].length
        end
      end
    end
  end
end
