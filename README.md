# SanitizeAttributes
Short description and motivation.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'sanitize_attributes'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install sanitize_attributes
```

## Configuration

You don't need to configure anything, but if you want to customize the behaviour, use the following snippet:

```ruby
SanitizeAttributes.configure do |config|
  config.keep_elements = %w(h1 h2 h3 p pre b i u br) # default value
end
```

## Using
[gem Sanitize](https://github.com/rgrove/sanitize)

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
