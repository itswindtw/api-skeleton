require 'webmock/rspec'
require 'bogus/rspec'
require 'rack/test'
require 'factory_girl'
require 'simplecov'

SimpleCov.start do
  add_filter '/spec/'
end

ENV['RACK_ENV'] = 'test'
require_relative '../config/environment'

Dir['./spec/support/**/*.rb'].each { |f| require f }
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Response::Helpers

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
