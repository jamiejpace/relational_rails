class ManufacturerBoozesController < ApplicationController
  def index
    @manufacturer = Manufacturer.find(params[:id])
    @boozes = @manufacturer.boozes
  end

  # def show
  #   @manufacturer = Manufacturer.find(params[:id])
  # end
end
