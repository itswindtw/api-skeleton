module Requests
  module JsonHelpers
    def json
      @json ||= MultiJson.load(last_response.body)
    end
  end
end