module Morse
  module Helpers
    module Sanitize
      def self.substitute_content(content)
        content.gsub(/Fullstop/, '.').gsub(/Comma/, ',')
      end
    end
  end
end