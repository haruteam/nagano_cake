class Public::ItemsController < ApplicationController

  def create
    @ci=CartItem.new(ci_params)
    if @ci.save
      redirect_to customer_cart_items_path
    else
      render :show
    end
  end


  def index
    @genre=Genre.all
    @items=Item.page(params[:page]).per(8)
    @items_all=Item.all
  end

  def show
    @genre=Genre.all
    @item=Item.find(params[:id])
    @customer=current_customer
    @cart_item=CartItem.new
  end

  private

  def ci_params
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end

end
