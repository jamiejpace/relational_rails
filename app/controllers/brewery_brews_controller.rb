class BreweryBrewsController < ApplicationController
  def index
    @brewery = Brewery.find(params[:id])
    if params[:sort_by] == "name"
      @brews = @brewery.brews.order(:name)
    elsif params[:abv_threshold]
      @brews = @brewery.brews.abv_threshold(params[:abv_threshold])
    else
      @brews = @brewery.brews
    end
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
