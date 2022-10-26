class Admin::OrdersController < ApplicationController
  def index
    @order=Order.find(params[:id])
  end

  def show
    @order=Order.find(params[:id])
    @order_detail=OrderDetail.where(order_id: params[:id])
  end
end
