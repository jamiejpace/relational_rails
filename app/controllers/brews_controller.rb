class BrewsController < ApplicationController
  def index
    @brews = Brew.all
  end

  def show
    @brew = Brew.find(params[:id])
  end
end
