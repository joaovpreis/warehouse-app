class WarehousesController < ApplicationController
  before_action :set_warehouse, only: [:show, :edit, :update, :destroy]
  def index
    @warehouses = Warehouse.all
  end

  def show
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

  def edit
  end

  def update
    if @warehouse.update warehouse_params
      redirect_to warehouse_path(@warehouse.id), notice: 'Galpão atualizado com sucesso!' and return
    end

    flash.now[:notice] = 'O Galpão não foi atualizado!' 
    render 'edit'
  end

  def destroy
    @warehouse.destroy

    redirect_to root_path, notice: 'Galpão removido com sucesso!'
  end

  private

  def set_warehouse
    @warehouse = Warehouse.find params[:id]
  end

  def warehouse_params 
    params.require(:warehouse).permit(:name, :code, :city, :area, :cep, :address, :description)
  end
end
