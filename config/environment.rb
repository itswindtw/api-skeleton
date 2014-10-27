def load_path(path)
  File.expand_path(path, File.dirname(__FILE__))
end

RACK_ENV = ENV['RACK_ENV'] || 'development'
BASE_PATH = load_path('..')
BUNDLE_GEMFILE = ENV['BUNDLE_GEMFILE'] || load_path('../Gemfile')

require 'bundler/setup' if File.exist?(BUNDLE_GEMFILE)
Bundler.require(:default, RACK_ENV)

$LOAD_PATH << load_path('../app')
$LOAD_PATH << load_path('../lib')

puts "Initializing API service in #{RACK_ENV} mode"
require_relative 'application'
