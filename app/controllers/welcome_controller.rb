class WelcomeController < ApplicationController
  require 'rest-client'

  def index
    # headers = { content_type: :json, host: "testapi.novaposhta.ua"}
    @response = RestClient.post('http://testapi.novaposhta.ua/v2.0/json/Address/getCities', [{"modelName": "Address",
                                                                                             "calledMethod": "getCities",
                                                                                             "apiKey": "#{api_key}"
                                                                                             }].to_json)
    @cities = JSON.parse(@response)
  end

end
