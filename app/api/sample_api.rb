module API
  class SampleAPI < Grape::API
    get 'hello' do
      { 'Hello' => 'Rack' }
    end
  end
end
