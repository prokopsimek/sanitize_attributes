module SanitizeAttributes
  class Configuration
    attr_accessor :keep_elements

    def initialize
      @keep_elements = %w(h1 h2 h3 p pre b i u br)
    end
  end
end
