# Morse

Translates to morse code with ability to obfuscate

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'morse'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install morse

## Usage

CLI is available as below.

### Help

```
danebalia@furian ~/D/G/P/morse (master)> bin/translate.rb -h
 Translate To Morse Code and Obfuscate

    ** Multiple words require quotes ("|'). Eg. "hello my name is"

    Usage: translate.rb [options]

    -h, --help                       Show this help message
    -f, --file FILENAME              File to translate and obfuscate
    -w, --words word(s)              Word(s) to translate and obfuscate
```

#### Translate and Obfuscate a Sentence
```
danebalia@furian ~/D/G/P/morse (master)> bin/translate.rb -w "I AM IN TROUBLE"
2/1A|B/2|A1/A|1A1|C|2A|A3|1A2|1
Result written out to file output.txt (size= 32)
```

#### Translate and Obfuscate with Source File
```
danebalia@furian ~/D/G/P/morse (master)> bin/translate.rb -f spec/sample.txt
Result written out to file output.txt (size= 431)
```
*PS. (size= x) - the size of the output file after write*

### Using as a Gem

#### Translate Text

```
danebalia@furian ~/D/G/P/morse (master)> bundle console
irb(main):001:0> Morse.translate_text('I AM IN TROUBLE')
=> "../.-|--/..|-./-|.-.|---|..-|-...|.-..|."
```

#### Obfuscate Morse Code

```
irb(main):005:0> x = Morse.translate_text('I AM IN TROUBLE')
=> "../.-|--/..|-./-|.-.|---|..-|-...|.-..|."
irb(main):006:0> Morse.confound_translation(x)
=> "2/1A|B/2|A1/A|1A1|C|2A|A3|1A2|1"
```

## Tests

Rspec

```
# rspec
```

CI can be found [here](https://travis-ci.org/daneb/morse)

## Trade Offs
1. Lookup tables are plain old ruby objects 
    - To compensate added flexibility to provide alternate models using dynamic class injection
2. Do not have supporting tests for CLI (bin/translate.rb)
3. Main (morse.rb) extends behavior for Translation and Obfuscation (pluggability)
4. Obfuscator has another layer of indirection to support alternative obfuscation strategies
6. Have a **hack** to support FullStop and Comma. Given dependence of 'char' enumeration in the algorithms, gsub replace FullStop with . and Comma with , (reference providers/poro.rb and helpers/sanitize.rb)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/morse. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

