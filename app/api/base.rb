require 'grape'

require 'api/sample_api'

module API
  class Base < Grape::API
    format :json

    # handle default exception
    rescue_from :all do |e|
      # Base.logger.error(e)
      rack_response({})
    end

    helpers do
      def logger
        Base.logger
      end
    end

    # mount APIs here
    mount API::SampleAPI
  end
end
