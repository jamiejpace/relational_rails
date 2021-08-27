class BrewsController < ApplicationController
  def index
    @brews = Brew.all
  end
end
