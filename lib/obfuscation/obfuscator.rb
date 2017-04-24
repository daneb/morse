require 'obfuscation/algorithms/saas_devi'

module Morse
  module Obfuscation
    module Obfuscator
      def obfuscate(morse_code)
        Algorithms::SaasDevi.obfuscate(morse_code)
      end
    end
  end
end
