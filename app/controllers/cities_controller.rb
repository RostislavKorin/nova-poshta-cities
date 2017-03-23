class CitiesController < ApplicationController


  def index
    @api_key = params[:api_key]
    if @api_key.blank?
      flash[:error] = "Please enter your api key"
      redirect_to root_path
    else
      @cities = City.all(@api_key)
      unless @cities[0]["success"]
        flash[:error] = "Wrong api key"
        redirect_to root_path
      end
    end
  end

end
