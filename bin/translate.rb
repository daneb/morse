#!/usr/bin/env ruby

require 'optparse'
require 'bundler/setup'
require 'morse'

# This will hold the options we parse
options = {}

OptionParser.new do |parser|

  parser.banner = %( Translate To Morse Code and Obfuscate

    ** Multiple words require quotes ("|'). Eg. "hello my name is"

    Usage: translate.rb [options]'
  )

  parser.on('-h', '--help', 'Show this help message') do ||
    puts parser
  end

  parser.on('-f', '--file FILENAME', 'File to translate and obfuscate') do |v|
    options[:filename] = v
  end

  parser.on('-w', '--words word(s)', 'Word(s) to translate and obfuscate') do |v|
    options[:words] = v
  end
end.parse!

def exit_and_notify_if_non_alphanumerics(input)
  if contains_non_alphanumeric?(input)
    puts 'Only alphanumerics are supported'
    exit
  end
end

def contains_non_alphanumeric?(data)
  data.scan(/([^A-Za-z0-9\s])/m).count.positive?
end

# Validation and Main
if options[:words]
  exit_and_notify_if_non_alphanumerics(options[:words]) 
  puts Morse.confound(options[:words])
elsif options[:filename]
  puts 'File does not exist' unless File.exist?(options[:filename])
  file = File.open(options[:filename], 'rb')
  contents = file.read
  exit_and_notify_if_non_alphanumerics(contents)
  puts Morse.confound(contents)
end

