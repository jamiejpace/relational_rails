class BreweriesController < ApplicationController
  def index
    @breweries = Brewery.all
  end

  def show
    @brewery = Brewery.find(params[:id])
  end

  def new
  end

  def create
    @brewery = Brewery.create(brewery_params)
    redirect_to "/breweries"
  end

  def edit
    @brewery = Brewery.find(params[:id])
  end

  def update
    brewery = Brewery.find(params[:id])
    brewery.update(brewery_params)
    redirect_to "/breweries/#{brewery.id}"
  end

  def destroy
    brewery = Brewery.find(params[:id])
    brewery.destroy
    redirect_to '/breweries'
  end

private
  def brewery_params
    params.permit(:name, :year_established, :food_available)
  end
end
