require 'bundler/setup'
require 'active_record'
require 'rspec/core'
require 'rspec/core/rake_task'
require 'dotenv'

Dotenv.load

include ActiveRecord::Tasks

RSpec::Core::RakeTask.new
task :default => :spec
task :test => :spec

DatabaseTasks.root = File.dirname(__FILE__)

db_dir = File.expand_path('../db', __FILE__)
config_dir = File.expand_path('../config', __FILE__)

DatabaseTasks.env = ENV['RANKME_ENV'] || 'development'
DatabaseTasks.db_dir = db_dir

yaml = Pathname.new(File.join(config_dir, 'database.yml'))
config = YAML.load(ERB.new(yaml.read).result)

DatabaseTasks.database_configuration = config
DatabaseTasks.migrations_paths = File.join(db_dir, 'migrate')

task :environment do
  ActiveRecord::Base.configurations = DatabaseTasks.database_configuration
  ActiveRecord::Base.establish_connection DatabaseTasks.env.to_sym
end

load 'active_record/railties/databases.rake'
