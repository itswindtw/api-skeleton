require_relative 'config/environment'

use Rack::CommonLogger, Logger.new(File.join(BASE_PATH, "log/#{RACK_ENV}.log"))

run API::Base