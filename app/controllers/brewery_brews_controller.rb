class BreweryBrewsController < ApplicationController
  def index
    @brewery = Brewery.find(params[:id])
    @brews = @brewery.brews
  end

  def new
    @brewery = Brewery.find(params[:id])
  end

  def create
    brewery = Brewery.find(params[:id])
    brew = brewery.brews.create(brew_params)
    redirect_to "/breweries/#{brewery.id}/brews"
  end

private
  def brew_params
    params.permit(:name, :abv, :beer_type, :gluten_free, :on_tap)
  end
end
