#!/usr/bin/env ruby

require 'optparse'
require 'bundler/setup'
require 'morse'

OUTPUT_FILE = 'output.txt'.freeze

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

def write_out_to_file(result)
  File.open(OUTPUT_FILE, 'w') do |file|
    file.puts result
  end
end

def output_file_size
  File.size(OUTPUT_FILE)
end

def read_source_file(file)
  unless File.exist?(file)
    puts 'File does not exist'
    exit
  end
  file = File.open(file, 'rb')
  file.read
end

def execute(text)
  Morse.confound(text)
rescue => e
  puts "Unexpected error: #{e.message}"
end

def dump_to_file(result)
  write_out_to_file(result)
  puts "Result written out to file #{OUTPUT_FILE} (size= #{output_file_size})"
end

# Validation and Main
if options[:words]
  exit_and_notify_if_non_alphanumerics(options[:words])
  result = execute(options[:words])
  puts result
  dump_to_file(result)
elsif options[:filename]
  contents = read_source_file(options[:filename])
  exit_and_notify_if_non_alphanumerics(contents)
  result = execute(contents)
  dump_to_file(result)
end


