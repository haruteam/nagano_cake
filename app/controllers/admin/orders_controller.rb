class Admin::OrdersController < ApplicationController
  def index
    @order=Order.find(params[:id])
  end

  def show
    @orser=Order.find(params[:id])
  end
end
