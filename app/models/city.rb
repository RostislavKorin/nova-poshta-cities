require 'rest-client'

class City

  def self.all(api_key)
    response = RestClient.post('http://testapi.novaposhta.ua/v2.0/json/Address/getCities', [{"modelName": "Address",
                                                                                             "calledMethod": "getCities",
                                                                                             "apiKey": api_key
                                                                                             }].to_json)
    JSON.parse(response)
  end

end
