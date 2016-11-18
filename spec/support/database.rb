# set adapter to use, default is sqlite3
db_name = 'sqlite3'
database_yml = File.expand_path('../../internal/config/database.yml', __FILE__)

if File.exist?(database_yml)

  ActiveRecord::Migration.verbose = false
  ActiveRecord::Base.default_timezone = :utc
  ActiveRecord::Base.configurations = YAML.load_file(database_yml)
  ActiveRecord::Base.logger = Logger.new(File.join(File.dirname(__FILE__), '../debug.log'))
  ActiveRecord::Base.logger.level = ENV['TRAVIS'] ? ::Logger::ERROR : ::Logger::DEBUG
  config = ActiveRecord::Base.configurations[db_name]

  ActiveRecord::Base.establish_connection(db_name.to_sym)
  ActiveRecord::Base.connection

  load(File.dirname(__FILE__) + '/../internal/db/schema.rb')
  load(File.dirname(__FILE__) + '/../internal/app/models/models.rb')

else
  fail "Please create #{database_yml} first to configure your database. Take a look at: #{database_yml}.sample"
end