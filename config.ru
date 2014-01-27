require_relative 'config/environment'

use Rack::CommonLogger, $logger
run API::Base