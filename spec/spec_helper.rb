require "bundler/setup"
require "morse"
require 'helpers/morse_error'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  MH = Morse::Helpers
  MOA = Morse::Obfuscation::Algorithms
  MP = Morse::Providers
  MT = Morse::Translation
end
