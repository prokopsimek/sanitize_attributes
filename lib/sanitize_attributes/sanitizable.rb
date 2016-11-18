module SanitizeAttributes
	module Sanitizable

		class_eval do
	    def sanitize_attributes(*attrs)
	      attrs.each do |attr|
	        define_method attr do
	          safe_sanitize attribute(attr)
	        end

	        define_method "#{attr}=" do |val|
	          write_attribute attr, safe_sanitize(val)
	        end

	        define_method "safe_sanitize" do |text|
	          Sanitize
	          	.fragment(text, elements: SanitizeAttributes.configuration.keep_elements)
	          	.strip
	        end
	      end
	    end
    end

	end
end
