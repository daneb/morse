module Morse
  module Providers
    class Poro
      def query_morse(key) 
        db_morse.fetch(key, '')
      end

      def query_dash(key)
        db_dash.fetch(key, '')
      end

      private
      def db_dash
        {
          '1' => 'A',
          '2' => 'B',
          '3' => 'C',
          '4' => 'D',
          '5' => 'E' 
        }
      end

      def db_morse
        { 'A' => '.-',
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
          'Comma' => '--..--',
          '.' => '.-.-.-', 
          ',' => '--..--' 
        }
      end
    end
  end
end