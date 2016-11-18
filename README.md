# SanitizeAttributes
Rails gem to sanitize attributes in write & read methods.

## Usage
In your model do e.g.:
```ruby
sanitize_attributes :short_description
```
and from attribute `short_description` will be removed tags as defined in your config

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'active_record_sanitize_attributes'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install active_record_sanitize_attributes
```

## Configuration

You don't need to configure anything, but if you want to customize the behaviour, use the following snippet:

create file `initializers/sanitize_attributes.rb`

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
