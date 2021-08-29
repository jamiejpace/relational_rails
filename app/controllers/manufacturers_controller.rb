class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def new
  end

  def create
    manufacturer = Manufacturer.create(manufacturer_params)
    redirect_to "/manufacturers"
  end

private
  def manufacturer_params
    params.permit(:name, :year_established, :domestic)
  end
end
