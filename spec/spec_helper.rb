$LOAD_PATH << '.' unless $LOAD_PATH.include?('.')
$LOAD_PATH.unshift(File.expand_path('../../lib', __FILE__))

require File.expand_path('../../lib/sanitize_attributes', __FILE__)
I18n.enforce_available_locales = true
require 'rails'

Dir['./spec/support/**/*.rb'].sort.each { |f| require f }

RSpec.configure do |config|
  config.raise_errors_for_deprecations!
end