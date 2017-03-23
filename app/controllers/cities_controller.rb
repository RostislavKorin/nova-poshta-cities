class CitiesController < ApplicationController
  require 'rest-client'
  def index
    @api_key = params[:api_key]
    if @api_key.blank?
      flash[:error] = "Please enter your api key"
      redirect_to root_path
    else

      @response = RestClient.post('http://testapi.novaposhta.ua/v2.0/json/Address/getCities', [{"modelName": "Address",
                                                                                               "calledMethod": "getCities",
                                                                                               "apiKey": @api_key
                                                                                               }].to_json)
      @cities = JSON.parse(@response)
      unless @cities[0]["success"]
        flash[:error] = "Wrong api key"
        redirect_to root_path
      end
    end
  end

end
