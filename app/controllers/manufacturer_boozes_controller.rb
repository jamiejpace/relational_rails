class ManufacturerBoozesController < ApplicationController
  def index
    @manufacturer = Manufacturer.find(params[:id])
    if params[:sort_by] == "name"
      @boozes = @manufacturer.boozes.order(:name)
    elsif params[:abv_threshold]
      @boozes = @manufacturer.boozes.abv_threshold(params[:abv_threshold])
    else
      @boozes = @manufacturer.boozes
    end
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
end
