class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
  end
  
  def create
    @order=Order.new(order_params)
    if @order.save
      redirect_to items_path
    end
  end
  
  def index
  end
  
  def confirm
    @order=Order.new(order_params)
    if @order.save
      redirect_to orders_complete_path
    end
  end

  def complete
  end

  def show
  end
  
  private
  
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address,
                                  :name, :shipping_cost, :total_payment, :payment_method, :status)
  end
  
end
