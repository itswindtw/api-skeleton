require 'bogus/rspec'
require 'rack/test'

ENV['RACK_ENV'] = 'test'
require_relative "../config/environment"

require_relative 'support/request_helpers'
RSpec.configure do |config|
  config.include Requests::JsonHelpers
end

require 'mock_redis'
$redis = Redis::Namespace.new('creole', :redis => MockRedis.new)
