# Logger
require 'logger'
$logger = Logger.new File.join(BASE_PATH, "log/#{RACK_ENV}.log")

# Database
require 'sequel'
config = YAML.load_file(File.join(BASE_PATH, 'config/database.yml'))[RACK_ENV]
DB = Sequel.connect(config)

Sequel.extension :migration
begin
  Sequel::Migrator.check_current(DB, File.join(BASE_PATH, 'db/migrations'))
rescue
  Sequel::Migrator.run(DB, File.join(BASE_PATH, 'db/migrations'))
end

# API
require 'api/base'