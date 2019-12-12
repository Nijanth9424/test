class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :destroy, :update]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to :action => 'index', notice: 'Item was created Successfully'
    else
      render 'new'
    end
  end

  def update
    if @item.update_attributes(item_params)
      redirect_to :action => 'index', notice: 'Item was updated Successfully'
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to :action => 'index', notice: 'Item destroyed.'
  end

  private

  def item_params
    params.require(:item).permit(:item_category_id, :name, :rate)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
