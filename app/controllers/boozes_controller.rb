class BoozesController < ApplicationController
  def index
    @boozes = Booze.all
  end

  def show
    @booze = Booze.find(params[:id])
  end

  def edit
    @booze = Booze.find(params[:id])
  end

  def update
    booze = Booze.find(params[:id])
    booze.update(booze_params)
    redirect_to "/boozes/#{booze.id}"
  end

private
  def booze_params
    params.permit(:name, :clear, :abv, :proof, :booze_type)
  end
end
