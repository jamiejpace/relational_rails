class BrewsController < ApplicationController
  def index
    @brews = Brew.all
  end

  def show
    @brew = Brew.find(params[:id])
  end

  def edit
    @brew = Brew.find(params[:id])
  end

  def update
    brew = Brew.find(params[:id])
    brew.update(brew_params)
    redirect_to "/brews/#{brew.id}"
  end

  def destroy
    brew = Brew.find(params[:id])
    brew.destroy
    redirect_to '/brews'
  end

private
  def brew_params
    params.permit(:name, :abv, :beer_type, :gluten_free, :on_tap)
  end
end
