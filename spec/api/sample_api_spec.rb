require 'spec_helper'

describe API::SampleAPI do
  include Rack::Test::Methods

  def app
    API::Base
  end

  context "/hello" do
    before { get 'hello' }
    let(:response) { MultiJson.load(last_response.body) }
    specify { response.should == { "Hello" => "Rack" } }
  end
end