# Minitest::Redgreen

Colorizes and corrects pluralization of Minitest output.

This gem was forked from https://github.com/jparker/minitest-redgreen. I found it wasn't published to RubyGems.org, but was a viable working alternative to `minitest-colorize` which is still uses `require 'minitest/unit'` and the older `MiniTest` module name instead of the newer `Minitest`.

I've added pluralization correction to the Minitest output, because incorrect grammar annoys me.

## Installation

Add this line to your application's Gemfile:

``` ruby
gem 'minitest-redgreen'
```

And then execute:

``` bash
$ bundle
```

Or install it yourself as:

``` bash
$ gem install minitest-redgreen
```

## Requirements

This gem has a dependency on `minitest 5.x`.

## Usage

Add this line to your application's test_helper.rb or spec_helper.rb:

``` ruby
require 'minitest/redgreen'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
