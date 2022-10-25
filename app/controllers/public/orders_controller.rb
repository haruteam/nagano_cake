class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    current_customer.cart_items.each do |ci|
      @order_detail = OrderDetail.new
      @order_detail.item_id = ci.item_id
      @order_detail.quantity = ci.amount
      @order_detail.purchase_price = (ci.item.price*1.1).floor
      @order_detail.order_id = @order.id
      @order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path

  end

  def index
    @order = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @orders = OrderDetail.where(order_id: params[:id])
  end

  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_cede
      @order.address = @address.address
      @order.name = @address.full_name
    elsif params[:order][:select_address] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    else
      render :new
    end
    @orders = current_customer.cart_items
    @ci_all_price = 0
  end

  def complete
  end


  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :total_payment,
                                  :name, :shipping_cost, :payment_method)
  end

end
