class SanitizableModel < ActiveRecord::Base
  sanitize_attributes :short_description
end
