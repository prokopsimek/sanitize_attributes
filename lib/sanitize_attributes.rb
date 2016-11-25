require 'active_record'
require 'active_record/version'
require 'active_support/core_ext/module'

require 'sanitize'
require 'sanitize_attributes/version'
require 'sanitize_attributes/configuration'
require 'sanitize_attributes/sanitizable'

begin
  require 'rails/engine'
  require 'sanitize_attributes/engine'
rescue LoadError
end

module SanitizeAttributes
  extend ActiveSupport::Autoload

  autoload :Sanitizable

  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def reset
      @configuration = Configuration.new
    end

    def configure
      yield(configuration)
    end
  end

  ActiveSupport.on_load(:active_record) do
    extend SanitizeAttributes::Sanitizable
  end
end
