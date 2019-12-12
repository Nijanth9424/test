class ItemTaxesController < ApplicationController
  before_action :set_item_tax, only: [:show, :edit, :update, :destroy]

  def index
    @item_taxes = ItemTax.all
  end

  def new
    @item_tax = ItemTax.new
  end

  def create
    @item_tax = ItemTax.new(item_tax_params)
    if @item_tax.save
      redirect_to :action => 'index', notice: 'ItemTax was created Successfully'
    else
      render 'new'
    end
  end

  def update
    @item_tax = ItemTax.find(params[:id])
    if @item_tax.update_attributes(item_tax_params)
      redirect_to :action => 'index', notice: 'ItemTax was updated Successfully'
    else
      render 'edit'
    end
  end

  def destroy
    @item_tax.destroy
    redirect_to :action => 'index', notice: 'ItemTax destroyed'
  end

  private

  def item_tax_params
    params.require(:item_tax).permit(:item_id, :tax_type, :tax)
  end

  def set_item_tax
    @item_tax = ItemTax.find(params[:id])
  end
end
