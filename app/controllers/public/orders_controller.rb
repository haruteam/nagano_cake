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
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800
    if params[:order][:select_address] == 0
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    elsif params[:order][:select_address] == 1
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_cede
      @order.address = @address.address
      @order.name = @address.last_name + @address.first_name
    end

    @orders = current_customer.cart_items
    @ci_all_price = 0
    

  end

  def complete
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address,
                                  :name, :shipping_cost, :payment_method)
  end

end
