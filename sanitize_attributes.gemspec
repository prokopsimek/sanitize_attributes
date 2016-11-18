$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sanitize_attributes/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sanitize_attributes"
  s.version     = SanitizeAttributes::VERSION
  s.authors     = ["Prokop Simek"]
  s.email       = ["prokop.simek@applifting.cz"]
  s.homepage    = "https://github.com/prokopsimek/sanitize_attributes"
  s.summary     = "Rails gem to sanitize attributes in write & read methods."
  s.description = "Rails gem to sanitize attributes in write & read methods."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files    = s.files.grep(%r{^spec/})
  s.require_paths = ['lib']
  s.required_ruby_version = '>= 2.0.0'

  s.add_dependency "rails", ">= 4"

  s.add_runtime_dependency 'activerecord'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'database_cleaner''
end
