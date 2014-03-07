require 'grape'

require 'api/sample_api'

module API
  class Base < Grape::API
    CONTENT_TYPE = "application/hal+json"
    RACK_CONTENT_TYPE_HEADER = { "Content-Type" => CONTENT_TYPE }
    HTTP_STATUS_CODES = Rack::Utils::HTTP_STATUS_CODES

    format :json
    content_type :json, CONTENT_TYPE

    # Handle exceptions

    # rescue_from do |e|
    #   Rack::Response.new({}.to_json, 412, RACK_CONTENT_TYPE_HEADER).finish
    # end

    # mount APIs here
    # 
    mount API::SampleAPI
  end
end
