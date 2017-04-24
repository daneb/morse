module Morse
  module Helpers
    module Validation
      def self.contains_non_alphanumeric?(data)
        data.scan(/([^A-Za-z0-9\s])/m).count.positive?
      end
    end
  end
end
