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
      redirect_to root_path, notice: 'Galpão cadastrado com sucesso!' and return
    end

    flash.now[:notice] = 'O Galpão não foi cadastrado!' 
    render 'new'

  end

  def warehouse_params 
    params.require(:warehouse).permit(:name, :code, :city, :area, :cep, :address, :description)
  end
end
