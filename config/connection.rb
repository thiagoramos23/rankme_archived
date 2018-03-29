require "pathname"
require "yaml"
require "erb"

# Enable ActiveRecord logging.
ActiveRecord::Base.logger = ActiveSupport::Logger.new(STDOUT) unless ENV['RANKME_ENV'] == 'test'

db_dir = File.expand_path('../db', __FILE__)
config_dir = File.expand_path('../', __FILE__)

environment = ENV['RANKME_ENV'] || 'development'

yaml = Pathname.new(File.join(config_dir, 'database.yml'))
config = YAML.load(ERB.new(yaml.read).result)

ActiveRecord::Base.configurations = config
ActiveRecord::Base.establish_connection environment.to_sym

