require 'grape'

require 'api/sample_api'

module API
  class Base < Grape::API
    format :json

    # handle default exception
    rescue_from :all do |_e|
      rack_response({})
    end

    # mount APIs here
    mount API::SampleAPI
  end
end
