class Public::CartItemsController < ApplicationController
  
  def new
    @cart_item=CartItem.new
  end

  def create
    @cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id], customer_id: current_customer.id)
    if @cart_item
      @cart_item.update(amount: params[:cart_item][:amount].to_i + @cart_item.amount.to_i)
      redirect_to customers_cart_items_path
    else
      @cart_item=CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
    if @cart_item.save
      redirect_to customers_cart_items_path
    end
      
    end
  end

  def index
    @cart_item=current_customer.cart_items
    
    

    
    @ci_all_price = 0
  end

  def update
    @cart_item=CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    if @cart_item.save
      redirect_to customers_cart_items_path
    end
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to customers_cart_items_path
  end

  def destroy
    @cart_item=CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to customers_cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end

end
