class ManufacturerBoozesController < ApplicationController
  def index
    @manufacturer = Manufacturer.find(params[:id])
    @boozes = @manufacturer.boozes
  end

  def new
    @manufacturer = Manufacturer.find(params[:id])
  end

  def create
    manufacturer = Manufacturer.find(params[:id])
    booze = manufacturer.boozes.create!(booze_params)
    redirect_to "/manufacturers/#{manufacturer.id}/boozes"
  end

private
  def booze_params
    params.permit(:name, :clear, :abv, :proof, :booze_type)
  end
  # def show
  #   @manufacturer = Manufacturer.find(params[:id])
  # end
end
