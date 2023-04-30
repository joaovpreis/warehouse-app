class WarehousesController < ApplicationController
  def index
    @warehouses = Warehouse.all
  end

  def show
    @warehouse = Warehouse.find(params[:id])
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new warehouse_params

    if @warehouse.save
      redirect_to root_path and return
    end

    render 'new'

  end

  def warehouse_params 
    params.require(:warehouse).permit(:name, :code, :city, :area, :cep, :address, :description)
  end
end
