class BoozesController < ApplicationController
  def index
    @boozes = Booze.all
  end

  def show
    @booze = Booze.find(params[:id])
  end
end
