# Stack

Stack is a ruby implementation of the EVM which was written to make it easier to
understand Ethereum at the bytecode level.

Learning Ethereum so close to the bytecode will give you major advantages in
optimizing gas when writing solidity code. Security concerns will also become
more understandable when you know exactly what you code compiles to.

Ruby is my favourite language and what I'm most comfortable expressing these
concepts in. I think ruby is beautiful and makes a great language to read, even
if you've never written it before.

## Current development status

I haven't implemented all opcodes. So far only one contract has been
successfully implemented. More on their way.

Gas costs are minimally implemented and dynamic gas costs are missing.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'stack'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install stack

## Usage

### Disassembly

We can use the disassemble method to turn raw bytecode into
more readable EVM assembly code.

```ruby
require "stack"

puts Stack.disassemble("6005600401") #=>
# 0     PUSH1   => 05
# 2     PUSH1   => 04
# 4     ADD

```

## Referenced resources

These are resources I used to guide implementation along the way:

- https://www.evm.codes/
- https://github.com/CoinCulture/evm-tools/blob/master/analysis/ethersignal/ethersignal.md
- https://takenobu-hs.github.io/downloads/ethereum_evm_illustrated.pdf

## Development

After checking out the repo, run `bin/setup` to install dependencies.
Then, run `rake spec` to run the tests. You can also run `bin/console`
for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`, and
then run `bundle exec rake release`, which will create a git tag for the
version, push git commits and the created tag, and push the `.gem` file
to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub
at https://github.com/nolantait/stack.

## License

The gem is available as open source under the terms of
the [MIT License](https://opensource.org/licenses/MIT).
