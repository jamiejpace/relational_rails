class BreweryBrewsController < ApplicationController
  def index
    @brewery = Brewery.find(params[:id])
    @brews = @brewery.brews
  end
end
