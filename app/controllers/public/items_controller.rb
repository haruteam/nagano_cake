class Public::ItemsController < ApplicationController


  def index
    @genre=Genre.all
    @items=Item.page(params[:page]).per(8)
    @items_all=Item.all
  end

  def show
    @genre=Genre.all
    @item=Item.find(params[:id])
    @customer=current_customer
  end

  private

end
