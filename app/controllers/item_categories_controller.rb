class ItemCategoriesController < ApplicationController
  before_action :set_item_categories, only: [:show, :edit, :update, :destroy]

  def index
    @item_categories = ItemCategory.all
  end

  def new
    @item_category = ItemCategory.new
  end

  def create
    @item_category = ItemCategory.new(item_categories_params)
    if @item_category.save
      redirect_to :action => 'index', notice: 'ItemCategory was created Successfully'
    else
      render 'new'
    end
  end

  def update
    if @item_category.update_attributes(item_categories_params)
      redirect_to :action => 'index', notice: 'ItemCategory updated'
    else
      render 'edit'
    end
  end

  def destroy
    @item_category.destroy
    redirect_to :action => 'index', notice: 'ItemCategory destroyed.'
  end

  private

  def item_categories_params
    params.require(:item_category).permit(:name)
  end

  def set_item_categories
    @item_category = ItemCategory.find(params[:id])
  end
end
