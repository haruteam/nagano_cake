class Admin::ItemsController < ApplicationController

  def new
    @item=Item.new
  end
  
  def create
    @item=Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      render :new
    end
    
  end
  
  def index
    @items=Item.all
  end
  
  def show
    @item=Item.where(id: params[:id])
  end
  
  
  private
  
  def item_params
    params.require(:item).permit(:name, :image, :introduction, :genre_id, :price, :is_active)
  end

end


