class Admin::ItemsController < ApplicationController

  def new
    @item=Item.new
  end
  
  def create
    @item=Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    end
  end
  
  def index
    @items=Item.all
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :image, :introduction, :genre_id, :price, :is_active)
  end

end


