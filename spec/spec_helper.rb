require 'bogus/rspec'
require 'rack/test'

ENV['RACK_ENV'] = 'test'
require_relative "../config/environment"